/*
 *  yosys -- Yosys Open SYnthesis Suite
 *
 *  Copyright (C) 2012 Claire X.
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
 *
 */

 #include "kernel/register.h"
 #include "kernel/celltypes.h"
 #include "kernel/rtlil.h"
 #include "kernel/log.h"
 
 USING_YOSYS_NAMESPACE
 PRIVATE_NAMESPACE_BEGIN
 
 struct SynthozixePass : public ScriptPass
 {
	 SynthozixePass() : ScriptPass("synth_ozixe", "synthesis for ozixe FPGAs") { }
 
	 void on_register() override
	 {
		 // Optionnel : Ajuster un param ABC9 par défaut
		 RTLIL::constpad["synth_ozixe.abc9.W"] = "300";
	 }
 
	 void help() override
	 {
		 log("\n");
		 log("    synth_ozixe [options]\n");
		 log("\n");
		 log("This command runs synthesis for ozixe FPGAs.\n");
		 log("\n");
		 log("    -top <module>\n");
		 log("        use the specified module as top module\n");
		 log("\n");
		 log("    -edif <file>\n");
		 log("        write the design to the specified EDIF file.\n");
		 log("\n");
		 log("    -json <file>\n");
		 log("        write the design to the specified JSON file.\n");
		 log("\n");
		 log("    -run <from_label>:<to_label>\n");
		 log("        only run the commands between the labels (see below).\n");
		 log("\n");
		 log("    -noflatten\n");
		 log("        do not flatten design before synthesis\n");
		 log("\n");
		 log("    -dff\n");
		 log("        run 'abc'/'abc9' with -dff option\n");
		 log("\n");
		 log("    -retime\n");
		 log("        run 'abc' with '-dff -D 1' options\n");
		 log("\n");
		 log("    -noccu2\n");
		 log("        do not use CCU2 cells in output netlist (carry chain)\n");
		 log("\n");
		 log("    -nodffe\n");
		 log("        do not use flipflops with CE in output netlist\n");
		 log("\n");
		 log("    -nobram\n");
		 log("        do not use block RAM cells in output netlist\n");
		 log("\n");
		 log("    -nolutram\n");
		 log("        do not use LUT RAM cells in output netlist\n");
		 log("\n");
		 log("    -nowidelut\n");
		 log("        do not implement wide LUT structures (PFU muxes)\n");
		 log("\n");
		 log("    -widelut\n");
		 log("        force use of wide LUT muxes\n");
		 log("\n");
		 log("    -asyncprld\n");
		 log("        use async PRLD mode to implement ALDFF (EXPERIMENTAL)\n");
		 log("\n");
		 log("    -abc2\n");
		 log("        run two passes of 'abc' for slightly improved logic density\n");
		 log("\n");
		 log("    -abc9\n");
		 log("        use new ABC9 flow (EXPERIMENTAL)\n");
		 log("\n");
		 log("    -iopad\n");
		 log("        insert IO buffers\n");
		 log("\n");
		 log("    -nodsp\n");
		 log("        do not map multipliers to DSP blocks\n");
		 log("\n");
		 log("    -no-rw-check\n");
		 log("        read/write collisions yield don't-care.\n");
		 log("\n");
		 log("    -cmp2softlogic\n");
		 log("        implement constant comparisons in soft logic\n");
		 log("\n");
		 log("The following commands are executed by this synthesis command:\n");
		 help_script();
		 log("\n");
	 }
 
	 // Options / flags
	 string top_opt, edif_file, json_file;
	 bool noccu2, nodffe, nobram, nolutram, nowidelut, asyncprld, flatten, dff, retime, abc2, abc9, iopad, nodsp, no_rw_check;
	 bool cmp2softlogic;
 
	 void clear_flags() override
	 {
		 top_opt      = "-auto-top";
		 edif_file    = "";
		 json_file    = "";
		 noccu2       = false;
		 nodffe       = false;
		 nobram       = false;
		 nolutram     = false;
		 nowidelut    = false;
		 asyncprld    = false;
		 flatten      = true;
		 dff          = false;
		 retime       = false;
		 abc2         = false;
		 abc9         = false;
		 iopad        = false;
		 nodsp        = false;
		 no_rw_check  = false;
		 cmp2softlogic = false;
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
				 run_from = args[++argidx].substr(0, pos);
				 run_to   = args[argidx].substr(pos+1);
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
			 if (args[argidx] == "-nolutram") {
				 nolutram = true;
				 continue;
			 }
			 if (args[argidx] == "-nowidelut") {
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
 
		 // Vérification basique
		 if (!design->full_selection())
			 log_cmd_error("This command only operates on fully selected designs!\n");
 
		 if (abc9 && retime)
			 log_cmd_error("-retime option not currently compatible with -abc9!\n");
 
		 log_header(design, "Executing SYNTH_OZIXE pass.\n");
		 log_push();
 
		 // Lancer le script
		 run_script(design, run_from, run_to);
 
		 log_pop();
	 }
 
	 // Voici la suite de passes exécutées
	 void script() override
	 {
		 std::string no_rw_check_opt = "";
		 if (no_rw_check)
			 no_rw_check_opt = " -no-rw-check";
		 if (help_mode)
			 no_rw_check_opt = " [-no-rw-check]";
 
		 if (check_label("begin"))
		 {
			 // Lire les fichiers ozixe de base
			 run("read_verilog -lib -specify +/ozixe/cells_sim_ozixe.v +/ozixe/cells_bb_ozixe.v");
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
			 if (!nodsp) {
				 // Ex. : map dsp si besoin
				 // run("techmap -map +/mul2dsp.v -map +/ozixe/dsp_map.v ...");
			 }
			 run("alumacc");
			 run("opt");
			 run("memory -nomap" + no_rw_check_opt);
			 run("opt_clean");
		 }
 
		 if (check_label("map_ram"))
		 {
			 // Pour brams, lutrams, etc.
			 run("memory_libmap -lib +/ozixe/lutrams.txt -lib +/ozixe/brams_ozixe.txt");
			 run("techmap -map +/ozixe/lutrams_map.v -map +/ozixe/brams_map_ozixe.v");
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
				 run("techmap -map +/techmap.v -map +/ozixe/arith_map_ozixe.v");
			 if (help_mode || iopad) {
				 run("iopadmap -bits -outpad OB I:O -inpad IB O:I -toutpad OBZ ~T:I:O -tinoutpad BB ~T:O:I:B A:top", "(only if '-iopad')");
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
			 run("dfflegalize" + dfflegalize_args);
			 run("opt_merge");
			 if (abc9 && dff)
				 run("zinit -all w:* t:$_DFF_?_ t:$_DFFE_??_ t:$_SDFF*");
			 // Mapper les DFF sur ozixe
			 run("techmap -D NO_LUT -map +/ozixe/cells_map.v");
			 run("opt_expr -undriven -mux_undef");
			 run("simplemap");
			 run("ozixe_gsr"); // s'il existe
			 run("opt_clean");
		 }
 
		 if (check_label("map_luts"))
		 {
			 if (abc2 || help_mode)
				 run("abc", "(only if -abc2)");
			 if (!asyncprld || help_mode)
				 run("techmap -map +/ozixe/latches_map.v", "(skip if -asyncprld)");
 
			 if (abc9) {
				 std::string abc9_opts;
				 abc9_opts += " -W 300"; // param par défaut
				 if (nowidelut)
					 abc9_opts += " -maxlut 4";
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
			 // On applique un mapping final sur cells_map.v
			 run("techmap -map +/ozixe/cells_map.v");
			 // On appelle ensuite notre pass opt_lut_ins pour ozixe
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
 
 PRIVATE_NAMESPACE_END
 