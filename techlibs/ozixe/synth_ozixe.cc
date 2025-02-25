/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) ...
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

 #include "kernel/register.h"
 #include "kernel/celltypes.h"
 #include "kernel/rtlil.h"
 #include "kernel/log.h"
 
 // ----- NOUVEAU : pour un plugin -----
 #include "kernel/plugin.h"  // <-- Fournit YOSYS_PLUGIN_EXPORT et l'API plugin
 // ------------------------------------
 
 USING_YOSYS_NAMESPACE
 PRIVATE_NAMESPACE_BEGIN
 
 //--------------------------------------------------------------------------------
 // La classe SynthozixePass définit la commande "synth_ozixe".
 //--------------------------------------------------------------------------------
 
 struct SynthozixePass : public ScriptPass
 {
	 SynthozixePass() : ScriptPass("synth_ozixe", "synthesis for ozixe FPGAs") { }
 
	 void on_register() override
	 {
		 // Exemple d'option stockée dans scratchpad (utilisé par ABC9)
		 RTLIL::constpad["synth_ozixe.abc9.W"] = "300";
	 }
 
	 void help() override
	 {
		 log("\n");
		 log("    synth_ozixe [options]\n");
		 log("\n");
		 log("This command runs synthesis for ozixe FPGAs (excluding iCE40 and Nexus).\n");
		 log("\n");
		 log("    -top <module>\n");
		 log("        use the specified module as top module\n");
		 log("\n");
		 log("    -family <family>\n");
		 log("        run synthesis for the specified ozixe architecture\n");
		 log("        supported values: ecp5, xo2, xo3, xo3d\n");
		 log("\n");
		 log("    -edif <file>\n");
		 log("        write the design to the specified EDIF file\n");
		 log("    -json <file>\n");
		 log("        write the design to the specified JSON file\n");
		 log("\n");
		 log("    -run <from_label>:<to_label>\n");
		 log("        only run the commands between the labels.\n");
		 log("\n");
		 log("    -noflatten\n");
		 log("        do not flatten design before synthesis\n");
		 log("    -dff\n");
		 log("        run 'abc'/'abc9' with -dff option\n");
		 log("    -retime\n");
		 log("        run 'abc' with '-dff -D 1' options\n");
		 log("    -noccu2, -nodffe, -nobram, -nolutram, -nowidelut, -asyncprld,\n");
		 log("    -abc2, -abc9, -iopad, -nodsp, -no-rw-check, -cmp2softlogic\n");
		 log("        options spécifiques pour contrôler la synthèse.\n");
		 log("\n");
		 log("The following commands are executed by this synthesis command:\n");
		 help_script();
		 log("\n");
	 }
 
	 // Flags et paramètres de la commande
	 string top_opt, edif_file, json_file, family;
	 bool noccu2, nodffe, nobram, nolutram, nowidelut, asyncprld, flatten, dff, retime, abc2, abc9, iopad, nodsp, no_rw_check, have_dsp, cmp2softlogic;
	 string postfix, arith_map, brams_map, dsp_map;
 
	 void clear_flags() override
	 {
		 top_opt = "-auto-top";
		 edif_file = "";
		 json_file = "";
		 family = "";
		 noccu2 = false;
		 nodffe = false;
		 nobram = false;
		 nolutram = false;
		 nowidelut = false;
		 asyncprld = false;
		 flatten = true;
		 dff = false;
		 retime = false;
		 abc2 = false;
		 abc9 = false;
		 iopad = false;
		 nodsp = false;
		 no_rw_check = false;
		 cmp2softlogic = false;
		 postfix = "";
		 arith_map = "";
		 brams_map = "";
		 dsp_map = "";
		 have_dsp = false;
	 }
 
	 void execute(std::vector<std::string> args, RTLIL::Design *design) override
	 {
		 string run_from, run_to;
		 bool force_widelut = false;
		 clear_flags();
 
		 size_t argidx;
		 for (argidx = 1; argidx < args.size(); argidx++)
		 {
			 if (args[argidx] == "-top" && argidx+1 < args.size()) {
				 top_opt = "-top " + args[++argidx];
				 continue;
			 }
			 if ((args[argidx] == "-family" || args[argidx] == "-arch") && argidx+1 < args.size()) {
				 family = args[++argidx];
				 continue;
			 }
			 if (args[argidx] == "-edif" && argidx+1 < args.size()) {
				 edif_file = args[++argidx];
				 continue;
			 }
			 if (args[argidx] == "-json" && argidx+1 < args.size()) {
				 json_file = args[++argidx];
				 continue;
			 }
			 if (args[argidx] == "-run" && argidx+1 < args.size()) {
				 size_t pos = args[argidx+1].find(':');
				 if (pos == std::string::npos)
					 break;
				 run_from = args[argidx+1].substr(0, pos);
				 run_to   = args[argidx+1].substr(pos+1);
				 argidx++;
				 continue;
			 }
			 if (args[argidx] == "-flatten") {
				 flatten = true;
				 continue;
			 }
			 if (args[argidx] == "-noflatten") {
				 flatten = false;
				 continue;
			 }
			 if (args[argidx] == "-dff") {
				 dff = true;
				 continue;
			 }
			 if (args[argidx] == "-retime") {
				 retime = true;
				 continue;
			 }
			 if (args[argidx] == "-noccu2") {
				 noccu2 = true;
				 continue;
			 }
			 if (args[argidx] == "-nodffe") {
				 nodffe = true;
				 continue;
			 }
			 if (args[argidx] == "-nobram") {
				 nobram = true;
				 continue;
			 }
			 if (args[argidx] == "-asyncprld") {
				 asyncprld = true;
				 continue;
			 }
			 if (args[argidx] == "-nolutram" || args[argidx] == "-nodram") {
				 nolutram = true;
				 continue;
			 }
			 if (args[argidx] == "-nowidelut" || args[argidx] == "-nomux") {
				 nowidelut = true;
				 force_widelut = true;
				 continue;
			 }
			 if (args[argidx] == "-widelut") {
				 nowidelut = false;
				 force_widelut = true;
				 continue;
			 }
			 if (args[argidx] == "-abc2") {
				 abc2 = true;
				 continue;
			 }
			 if (args[argidx] == "-abc9") {
				 abc9 = true;
				 continue;
			 }
			 if (args[argidx] == "-iopad") {
				 iopad = true;
				 continue;
			 }
			 if (args[argidx] == "-nodsp") {
				 nodsp = true;
				 continue;
			 }
			 if (args[argidx] == "-no-rw-check") {
				 no_rw_check = true;
				 continue;
			 }
			 if (args[argidx] == "-cmp2softlogic") {
				 cmp2softlogic = true;
				 continue;
			 }
			 break;
		 }
		 extra_args(args, argidx, design);
 
		 if (family.empty())
			 log_cmd_error("ozixe family parameter must be set.\n");
 
		 if (family == "ecp5") {
			 postfix = "_ecp5";
			 arith_map = "_ccu2c";
			 brams_map = "_16kd";
			 dsp_map = "_18x18";
			 have_dsp = true;
		 } else if (family == "xo2" ||
					family == "xo3" ||
					family == "xo3d")
		 {
			 postfix = "_" + family;
			 arith_map = "_ccu2d";
			 brams_map = "_8kc";
			 have_dsp = false;
			 if (!force_widelut) nowidelut = true;
		 } else {
			 log_cmd_error("Invalid ozixe -family setting: '%s'.\n", family.c_str());
		 }
 
		 if (!design->full_selection())
			 log_cmd_error("This command only operates on fully selected designs!\n");
 
		 if (abc9 && retime)
			 log_cmd_error("-retime option not currently compatible with -abc9!\n");
 
		 log_header(design, "Executing SYNTH_ozixe pass.\n");
		 log_push();
 
		 run_script(design, run_from, run_to);
 
		 log_pop();
	 }
 
	 void script() override
	 {
		 std::string no_rw_check_opt = "";
		 if (no_rw_check)
			 no_rw_check_opt = " -no-rw-check";
		 if (help_mode)
			 no_rw_check_opt = " [-no-rw-check]";
 
		 if (check_label("begin"))
		 {
			 run("read_verilog -lib -specify +/ozixe/cells_sim" + postfix + ".v +/ozixe/cells_bb" + postfix + ".v");
			 run(stringf("hierarchy -check %s", help_mode ? "-top <top>" : top_opt.c_str()));
		 }
 
		 if (check_label("coarse"))
		 {
			 run("proc");
			 if (flatten || help_mode)
				 run("flatten");
			 run("tribuf -logic");
			 run("deminout");
			 run("opt_expr");
			 run("opt_clean");
			 run("check");
			 run("opt -nodffe -nosdff");
			 run("fsm");
			 run("opt");
			 run("wreduce");
			 run("peepopt");
			 run("opt_clean");
			 run("share");
			 if (cmp2softlogic)
				 run("techmap -map +/cmp2softlogic.v");
			 run("techmap -map +/cmp2lut.v -D LUT_WIDTH=4");
			 run("opt_expr");
			 run("opt_clean");
			 if (have_dsp && !nodsp) {
				 run("techmap -map +/mul2dsp.v -map +/ozixe/dsp_map" + dsp_map + ".v -D DSP_A_MAXWIDTH=18 -D DSP_B_MAXWIDTH=18 -D DSP_A_MINWIDTH=2 -D DSP_B_MINWIDTH=2 -D DSP_NAME=$__MUL18X18", "(unless -nodsp)");
				 run("chtype -set $mul t:$__soft_mul", "(unless -nodsp)");
			 }
			 if (family == "xo3" || help_mode)
				 run("booth", "(only if '-family xo3')");
			 run("alumacc");
			 run("opt");
			 run("memory -nomap" + no_rw_check_opt);
			 run("opt_clean");
		 }
 
		 if (check_label("map_ram"))
		 {
			 std::string args = "";
			 if (help_mode)
				 args += " [-no-auto-block] [-no-auto-distributed]";
			 else {
				 if (nobram)
					 args += " -no-auto-block";
				 if (nolutram)
					 args += " -no-auto-distributed";
			 }
			 run("memory_libmap -lib +/ozixe/lutrams.txt -lib +/ozixe/brams" + brams_map + ".txt" + args, "(-no-auto-block if -nobram, -no-auto-distributed if -nolutram)");
			 run("techmap -map +/ozixe/lutrams_map.v -map +/ozixe/brams_map" + brams_map + ".v");
		 }
 
		 if (check_label("map_ffram"))
		 {
			 run("opt -fast -mux_undef -undriven -fine");
			 run("memory_map");
			 run("opt -undriven -fine -mux_undef");
		 }
 
		 if (check_label("map_gates"))
		 {
			 if (noccu2)
				 run("techmap");
			 else
				 run("techmap -map +/techmap.v -map +/ozixe/arith_map" + arith_map + ".v");
			 if (help_mode || iopad) {
				 run("iopadmap -bits -outpad OB I:O -inpad IB O:I -toutpad OBZ ~T:I:O -tinoutpad BB ~T:O:I:B A:top", "(only if '-iopad')");
				 run("attrmvcp -attr src -attr LOC t:OB %x:+[O] t:OBZ %x:+[O] t:BB %x:+[B]");
				 run("attrmvcp -attr src -attr LOC -driven t:IB %x:+[I]");
			 }
			 run("opt -fast");
			 if (retime || help_mode)
				 run("abc -dff -D 1", "(only if -retime)");
		 }
 
		 if (check_label("map_ffs"))
		 {
			 run("opt_clean");
			 std::string dfflegalize_args = " -cell $_DFF_?_ 01 -cell $_DFF_?P?_ r -cell $_SDFF_?P?_ r";
			 if (help_mode) {
				 dfflegalize_args += " [-cell $_DFFE_??_ 01 -cell $_DFFE_?P??_ r -cell $_SDFFE_?P??_ r]";
			 } else if (!nodffe) {
				 dfflegalize_args += " -cell $_DFFE_??_ 01 -cell $_DFFE_?P??_ r -cell $_SDFFE_?P??_ r";
			 }
			 if (help_mode) {
				 dfflegalize_args += " [-cell $_ALDFF_?P_ x -cell $_ALDFFE_?P?_ x] [-cell $_DLATCH_?_ x]";
			 } else if (asyncprld) {
				 dfflegalize_args += " -cell $_ALDFF_?P_ x -cell $_ALDFFE_?P?_ x";
			 } else {
				 dfflegalize_args += " -cell $_DLATCH_?_ x";
			 }
			 run("dfflegalize" + dfflegalize_args, "($_ALDFF_*_ only if -asyncprld, $_DLATCH_* only if not -asyncprld, $_*DFFE_* only if not -nodffe)");
			 run("opt_merge");
			 if ((abc9 && dff) || help_mode)
				 run("zinit -all w:* t:$_DFF_?_ t:$_DFFE_??_ t:$_SDFF*", "(only if -abc9 and -dff)");
			 run("techmap -D NO_LUT -map +/ozixe/cells_map.v");
			 run("opt_expr -undriven -mux_undef");
			 run("simplemap");
			 run("ozixe_gsr");
			 run("attrmvcp -copy -attr syn_useioff");
			 run("opt_clean");
		 }
 
		 if (check_label("map_luts"))
		 {
			 if (abc2 || help_mode)
				 run("abc", "      (only if -abc2)");
 
			 if (!asyncprld || help_mode)
				 run("techmap -map +/ozixe/latches_map.v", "(skip if -asyncprld)");
 
			 if (abc9) {
				 std::string abc9_opts;
				 if (nowidelut)
					 abc9_opts += " -maxlut 4";
				 std::string k = "synth_ozixe.abc9.W";
				 if (active_design && active_design->scratchpad.count(k))
					 abc9_opts += stringf(" -W %s", active_design->scratchpad_get_string(k).c_str());
				 else
					 abc9_opts += stringf(" -W %s", RTLIL::constpad.at(k).c_str());
				 if (dff)
					 abc9_opts += " -dff";
				 run("abc9" + abc9_opts);
			 } else {
				 std::string abc_args = " -dress";
				 if (nowidelut)
					 abc_args += " -lut 4";
				 else
					 abc_args += " -lut 4:7";
				 if (dff)
					 abc_args += " -dff";
				 run("abc" + abc_args);
			 }
			 run("clean");
		 }
 
		 if (check_label("map_cells"))
		 {
			 run("techmap -map +/ozixe/cells_map.v");
			 run("opt_lut_ins -tech ozixe");
			 run("clean");
		 }
 
		 if (check_label("check"))
		 {
			 run("autoname");
			 run("hierarchy -check");
			 run("stat");
			 run("check -noinit");
			 run("blackbox =A:whitebox");
		 }
 
		 if (check_label("edif"))
		 {
			 if (!edif_file.empty() || help_mode)
				 run(stringf("write_edif %s", help_mode ? "<file-name>" : edif_file.c_str()));
		 }
 
		 if (check_label("json"))
		 {
			 if (!json_file.empty() || help_mode)
				 run(stringf("write_json %s", help_mode ? "<file-name>" : json_file.c_str()));
		 }
	 }
 } SynthozixePass;
 
 // ------------------------------------------------------------------------------------
 // (Exemple d'autre passe, commentée)
 // struct SynthEcp5Pass : public Pass
 // {
 // 	SynthEcp5Pass() : Pass("synth_ecp5", "synthesis for ECP5 FPGAs") { }
 //
 // 	void execute(std::vector<std::string> args, RTLIL::Design *design) override
 // 	{
 // 		args[0] = "synth_ozixe";
 // 		args.insert(args.begin()+1, std::string());
 // 		args.insert(args.begin()+1, std::string());
 // 		args[1] = "-family";
 // 		args[2] = "ecp5";
 // 		Pass::call(design, args);
 // 	}
 // } SynthEcp5Pass;
 // ------------------------------------------------------------------------------------
 
 PRIVATE_NAMESPACE_END
 
 // -----------------------------------------------------------------------------
 // NOUVEAU : Fonctions d'initialisation pour le plugin
 // -----------------------------------------------------------------------------
 
 extern "C" YOSYS_PLUGIN_EXPORT void yosys_plugin_initialize(PluginPassRegisterFunc pass_register)
 {
	 // Enregistrer la passe "synth_ozixe"
	 pass_register(new SynthozixePass);
 
	 // Si tu voulais enregistrer d'autres passes, tu pourrais le faire ici
	 // pass_register(new SynthEcp5Pass);
 }
 
 extern "C" YOSYS_PLUGIN_EXPORT const char *yosys_plugin_version()
 {
	 // Retourne la version de Yosys à laquelle on est compatible.
	 // On peut simplement retourner la constante définie par Yosys.
	 return yosys_version_str;
 }
 