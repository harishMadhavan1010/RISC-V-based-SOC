// Generated by SandPiper(TM) 1.12-2022/01/27-beta from Redwood EDA, LLC.
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


`include "sandpiper_gen.vh"


genvar dmem, imem, xreg;


//
// Signals declared top-level.
//

// For |cpu$br_tgt_pc.
wire [31:0] CPU_br_tgt_pc_a2;
reg  [31:0] CPU_br_tgt_pc_a3;

// For |cpu$dec_bits.
wire [10:0] CPU_dec_bits_a1;

// For |cpu$dest_not_zero.
wire CPU_dest_not_zero_a3;

// For |cpu$dmem_addr.
wire [3:0] CPU_dmem_addr_a4;

// For |cpu$dmem_rd_data.
wire [31:0] CPU_dmem_rd_data_a4;
reg  [31:0] CPU_dmem_rd_data_a5;

// For |cpu$dmem_rd_en.
wire CPU_dmem_rd_en_a4;

// For |cpu$dmem_wr_data.
wire [31:0] CPU_dmem_wr_data_a4;

// For |cpu$dmem_wr_en.
wire CPU_dmem_wr_en_a4;

// For |cpu$dummy.
wire [0:0] CPU_dummy_a0;

// For |cpu$funct3.
wire [2:0] CPU_funct3_a1;

// For |cpu$funct3_valid.
wire CPU_funct3_valid_a1;

// For |cpu$funct7.
wire [6:0] CPU_funct7_a1;

// For |cpu$funct7_valid.
wire CPU_funct7_valid_a1;

// For |cpu$g0_rf_rd_en1.
wire CPU_g0_rf_rd_en1_a2;

// For |cpu$g1_rf_rd_en2.
wire CPU_g1_rf_rd_en2_a2;

// For |cpu$imem_rd_addr.
wire [4-1:0] CPU_imem_rd_addr_a0;
reg  [4-1:0] CPU_imem_rd_addr_a1;

// For |cpu$imem_rd_data.
wire [31:0] CPU_imem_rd_data_a1;

// For |cpu$imem_rd_en.
wire CPU_imem_rd_en_a0;
reg  CPU_imem_rd_en_a1;

// For |cpu$imm.
wire [31:0] CPU_imm_a1;
reg  [31:0] CPU_imm_a2,
            CPU_imm_a3,
            CPU_imm_a4;

// For |cpu$inc_pc.
wire [31:0] CPU_inc_pc_a1;
reg  [31:0] CPU_inc_pc_a2,
            CPU_inc_pc_a3;

// For |cpu$instr.
wire [31:0] CPU_instr_a1;

// For |cpu$is_add.
wire CPU_is_add_a1;
reg  CPU_is_add_a2,
     CPU_is_add_a3,
     CPU_is_add_a4;

// For |cpu$is_addi.
wire CPU_is_addi_a1;
reg  CPU_is_addi_a2,
     CPU_is_addi_a3,
     CPU_is_addi_a4;

// For |cpu$is_and.
wire CPU_is_and_a1;
reg  CPU_is_and_a2,
     CPU_is_and_a3,
     CPU_is_and_a4;

// For |cpu$is_andi.
wire CPU_is_andi_a1;
reg  CPU_is_andi_a2,
     CPU_is_andi_a3,
     CPU_is_andi_a4;

// For |cpu$is_auipc.
wire CPU_is_auipc_a1;
reg  CPU_is_auipc_a2,
     CPU_is_auipc_a3,
     CPU_is_auipc_a4;

// For |cpu$is_b_instr.
wire CPU_is_b_instr_a1;

// For |cpu$is_beq.
wire CPU_is_beq_a1;
reg  CPU_is_beq_a2,
     CPU_is_beq_a3,
     CPU_is_beq_a4;

// For |cpu$is_bge.
wire CPU_is_bge_a1;
reg  CPU_is_bge_a2,
     CPU_is_bge_a3,
     CPU_is_bge_a4;

// For |cpu$is_bgeu.
wire CPU_is_bgeu_a1;
reg  CPU_is_bgeu_a2,
     CPU_is_bgeu_a3,
     CPU_is_bgeu_a4;

// For |cpu$is_blt.
wire CPU_is_blt_a1;
reg  CPU_is_blt_a2,
     CPU_is_blt_a3,
     CPU_is_blt_a4;

// For |cpu$is_bltu.
wire CPU_is_bltu_a1;
reg  CPU_is_bltu_a2,
     CPU_is_bltu_a3,
     CPU_is_bltu_a4;

// For |cpu$is_bne.
wire CPU_is_bne_a1;
reg  CPU_is_bne_a2,
     CPU_is_bne_a3,
     CPU_is_bne_a4;

// For |cpu$is_csrrc.
wire CPU_is_csrrc_a0;
reg  CPU_is_csrrc_a1,
     CPU_is_csrrc_a2,
     CPU_is_csrrc_a3,
     CPU_is_csrrc_a4;

// For |cpu$is_csrrci.
wire CPU_is_csrrci_a0;
reg  CPU_is_csrrci_a1,
     CPU_is_csrrci_a2,
     CPU_is_csrrci_a3,
     CPU_is_csrrci_a4;

// For |cpu$is_csrrs.
wire CPU_is_csrrs_a0;
reg  CPU_is_csrrs_a1,
     CPU_is_csrrs_a2,
     CPU_is_csrrs_a3,
     CPU_is_csrrs_a4;

// For |cpu$is_csrrsi.
wire CPU_is_csrrsi_a0;
reg  CPU_is_csrrsi_a1,
     CPU_is_csrrsi_a2,
     CPU_is_csrrsi_a3,
     CPU_is_csrrsi_a4;

// For |cpu$is_csrrw.
wire CPU_is_csrrw_a0;
reg  CPU_is_csrrw_a1,
     CPU_is_csrrw_a2,
     CPU_is_csrrw_a3,
     CPU_is_csrrw_a4;

// For |cpu$is_csrrwi.
wire CPU_is_csrrwi_a0;
reg  CPU_is_csrrwi_a1,
     CPU_is_csrrwi_a2,
     CPU_is_csrrwi_a3,
     CPU_is_csrrwi_a4;

// For |cpu$is_i_instr.
wire CPU_is_i_instr_a1;

// For |cpu$is_j_instr.
wire CPU_is_j_instr_a1;

// For |cpu$is_jal.
wire CPU_is_jal_a1;
reg  CPU_is_jal_a2,
     CPU_is_jal_a3,
     CPU_is_jal_a4;

// For |cpu$is_jalr.
wire CPU_is_jalr_a1;
reg  CPU_is_jalr_a2,
     CPU_is_jalr_a3,
     CPU_is_jalr_a4;

// For |cpu$is_lb.
wire CPU_is_lb_a0;
reg  CPU_is_lb_a1,
     CPU_is_lb_a2,
     CPU_is_lb_a3,
     CPU_is_lb_a4;

// For |cpu$is_lbu.
wire CPU_is_lbu_a0;
reg  CPU_is_lbu_a1,
     CPU_is_lbu_a2,
     CPU_is_lbu_a3,
     CPU_is_lbu_a4;

// For |cpu$is_lh.
wire CPU_is_lh_a0;
reg  CPU_is_lh_a1,
     CPU_is_lh_a2,
     CPU_is_lh_a3,
     CPU_is_lh_a4;

// For |cpu$is_lhu.
wire CPU_is_lhu_a0;
reg  CPU_is_lhu_a1,
     CPU_is_lhu_a2,
     CPU_is_lhu_a3,
     CPU_is_lhu_a4;

// For |cpu$is_load.
wire CPU_is_load_a1;
reg  CPU_is_load_a2,
     CPU_is_load_a3,
     CPU_is_load_a4;

// For |cpu$is_lui.
wire CPU_is_lui_a1;
reg  CPU_is_lui_a2,
     CPU_is_lui_a3,
     CPU_is_lui_a4;

// For |cpu$is_lw.
wire CPU_is_lw_a0;
reg  CPU_is_lw_a1,
     CPU_is_lw_a2,
     CPU_is_lw_a3,
     CPU_is_lw_a4;

// For |cpu$is_or.
wire CPU_is_or_a1;
reg  CPU_is_or_a2,
     CPU_is_or_a3,
     CPU_is_or_a4;

// For |cpu$is_ori.
wire CPU_is_ori_a1;
reg  CPU_is_ori_a2,
     CPU_is_ori_a3,
     CPU_is_ori_a4;

// For |cpu$is_r_instr.
wire CPU_is_r_instr_a1;

// For |cpu$is_s_instr.
wire CPU_is_s_instr_a1;
reg  CPU_is_s_instr_a2,
     CPU_is_s_instr_a3,
     CPU_is_s_instr_a4;

// For |cpu$is_sb.
wire CPU_is_sb_a1;
reg  CPU_is_sb_a2,
     CPU_is_sb_a3,
     CPU_is_sb_a4;

// For |cpu$is_sh.
wire CPU_is_sh_a1;
reg  CPU_is_sh_a2,
     CPU_is_sh_a3,
     CPU_is_sh_a4;

// For |cpu$is_sll.
wire CPU_is_sll_a1;
reg  CPU_is_sll_a2,
     CPU_is_sll_a3,
     CPU_is_sll_a4;

// For |cpu$is_slli.
wire CPU_is_slli_a1;
reg  CPU_is_slli_a2,
     CPU_is_slli_a3,
     CPU_is_slli_a4;

// For |cpu$is_slt.
wire CPU_is_slt_a1;
reg  CPU_is_slt_a2,
     CPU_is_slt_a3,
     CPU_is_slt_a4;

// For |cpu$is_slti.
wire CPU_is_slti_a1;
reg  CPU_is_slti_a2,
     CPU_is_slti_a3,
     CPU_is_slti_a4;

// For |cpu$is_sltiu.
wire CPU_is_sltiu_a1;
reg  CPU_is_sltiu_a2,
     CPU_is_sltiu_a3,
     CPU_is_sltiu_a4;

// For |cpu$is_sltu.
wire CPU_is_sltu_a1;
reg  CPU_is_sltu_a2,
     CPU_is_sltu_a3,
     CPU_is_sltu_a4;

// For |cpu$is_sra.
wire CPU_is_sra_a1;
reg  CPU_is_sra_a2,
     CPU_is_sra_a3,
     CPU_is_sra_a4;

// For |cpu$is_srai.
wire CPU_is_srai_a1;
reg  CPU_is_srai_a2,
     CPU_is_srai_a3,
     CPU_is_srai_a4;

// For |cpu$is_srl.
wire CPU_is_srl_a1;
reg  CPU_is_srl_a2,
     CPU_is_srl_a3,
     CPU_is_srl_a4;

// For |cpu$is_srli.
wire CPU_is_srli_a1;
reg  CPU_is_srli_a2,
     CPU_is_srli_a3,
     CPU_is_srli_a4;

// For |cpu$is_store.
wire CPU_is_store_a0;
reg  CPU_is_store_a1,
     CPU_is_store_a2,
     CPU_is_store_a3,
     CPU_is_store_a4;

// For |cpu$is_sub.
wire CPU_is_sub_a1;
reg  CPU_is_sub_a2,
     CPU_is_sub_a3,
     CPU_is_sub_a4;

// For |cpu$is_sw.
wire CPU_is_sw_a1;
reg  CPU_is_sw_a2,
     CPU_is_sw_a3,
     CPU_is_sw_a4;

// For |cpu$is_u_instr.
wire CPU_is_u_instr_a1;

// For |cpu$is_xor.
wire CPU_is_xor_a1;
reg  CPU_is_xor_a2,
     CPU_is_xor_a3,
     CPU_is_xor_a4;

// For |cpu$is_xori.
wire CPU_is_xori_a1;
reg  CPU_is_xori_a2,
     CPU_is_xori_a3,
     CPU_is_xori_a4;

// For |cpu$jalr_tgt_pc.
wire [31:0] CPU_jalr_tgt_pc_a2;
reg  [31:0] CPU_jalr_tgt_pc_a3;

// For |cpu$ld_data.
wire [31:0] CPU_ld_data_a5;

// For |cpu$opcode.
wire [6:0] CPU_opcode_a1;

// For |cpu$pc.
wire [31:0] CPU_pc_a0;
reg  [31:0] CPU_pc_a1,
            CPU_pc_a2,
            CPU_pc_a3,
            CPU_pc_a4;

// For |cpu$rd.
wire [4:0] CPU_rd_a1;
reg  [4:0] CPU_rd_a2,
           CPU_rd_a3,
           CPU_rd_a4,
           CPU_rd_a5;

// For |cpu$rd_valid.
wire CPU_rd_valid_a1;
reg  CPU_rd_valid_a2,
     CPU_rd_valid_a3,
     CPU_rd_valid_a4;

// For |cpu$reset.
wire CPU_reset_a0;
reg  CPU_reset_a1,
     CPU_reset_a2,
     CPU_reset_a3,
     CPU_reset_a4;

// For |cpu$result.
wire [31:0] CPU_result_a3;
reg  [31:0] CPU_result_a4;

// For |cpu$rf_rd_data1.
wire [31:0] CPU_rf_rd_data1_a2;

// For |cpu$rf_rd_data2.
wire [31:0] CPU_rf_rd_data2_a2;

// For |cpu$rf_rd_en1.
wire CPU_rf_rd_en1_a2;

// For |cpu$rf_rd_en2.
wire CPU_rf_rd_en2_a2;

// For |cpu$rf_rd_index1.
wire [4:0] CPU_rf_rd_index1_a2;

// For |cpu$rf_rd_index2.
wire [4:0] CPU_rf_rd_index2_a2;

// For |cpu$rf_wr_data.
wire [31:0] CPU_rf_wr_data_a3;

// For |cpu$rf_wr_en.
wire CPU_rf_wr_en_a3;

// For |cpu$rf_wr_index.
wire [4:0] CPU_rf_wr_index_a3;

// For |cpu$rs1.
wire [4:0] CPU_rs1_a1;
reg  [4:0] CPU_rs1_a2,
           CPU_rs1_a3,
           CPU_rs1_a4;

// For |cpu$rs1_valid.
wire CPU_rs1_valid_a1;
reg  CPU_rs1_valid_a2,
     CPU_rs1_valid_a3,
     CPU_rs1_valid_a4;

// For |cpu$rs2.
wire [4:0] CPU_rs2_a1;
reg  [4:0] CPU_rs2_a2,
           CPU_rs2_a3,
           CPU_rs2_a4;

// For |cpu$rs2_valid.
wire CPU_rs2_valid_a1;
reg  CPU_rs2_valid_a2,
     CPU_rs2_valid_a3,
     CPU_rs2_valid_a4;

// For |cpu$sltiu_rslt.
wire CPU_sltiu_rslt_a3;

// For |cpu$sltu_rslt.
wire CPU_sltu_rslt_a3;

// For |cpu$src1_value.
wire [31:0] CPU_src1_value_a2;
reg  [31:0] CPU_src1_value_a3,
            CPU_src1_value_a4;

// For |cpu$src2_value.
wire [31:0] CPU_src2_value_a2;
reg  [31:0] CPU_src2_value_a3,
            CPU_src2_value_a4;

// For |cpu$start.
wire CPU_start_a0;

// For |cpu$taken_br.
wire CPU_taken_br_a3;

// For |cpu$valid.
wire CPU_valid_a3;
reg  CPU_valid_a4;

// For |cpu$valid_jump.
wire CPU_valid_jump_a3;
reg  CPU_valid_jump_a4,
     CPU_valid_jump_a5;

// For |cpu$valid_load.
wire CPU_valid_load_a3;
reg  CPU_valid_load_a4,
     CPU_valid_load_a5;

// For |cpu$valid_taken_br.
wire CPU_valid_taken_br_a3;
reg  CPU_valid_taken_br_a4,
     CPU_valid_taken_br_a5;

// For |cpu$write_valid.
wire CPU_write_valid_a3;

// For |cpu/dmem$value.
wire [31:0] CPU_Dmem_value_a4 [15:0];
reg  [31:0] CPU_Dmem_value_a5 [15:0];

// For |cpu/imem$instr.
wire [31:0] CPU_Imem_instr_a1 [12:0];

// For |cpu/xreg$value.
wire [31:0] CPU_Xreg_value_a3 [31:0];
reg  [31:0] CPU_Xreg_value_a4 [31:0];

// For |cpuviz$imm.
wire [31:0] CPUVIZ_imm_a4;

// For |cpuviz$is_add.
wire CPUVIZ_is_add_a4;

// For |cpuviz$is_addi.
wire CPUVIZ_is_addi_a4;

// For |cpuviz$is_and.
wire CPUVIZ_is_and_a4;

// For |cpuviz$is_andi.
wire CPUVIZ_is_andi_a4;

// For |cpuviz$is_auipc.
wire CPUVIZ_is_auipc_a4;

// For |cpuviz$is_beq.
wire CPUVIZ_is_beq_a4;

// For |cpuviz$is_bge.
wire CPUVIZ_is_bge_a4;

// For |cpuviz$is_bgeu.
wire CPUVIZ_is_bgeu_a4;

// For |cpuviz$is_blt.
wire CPUVIZ_is_blt_a4;

// For |cpuviz$is_bltu.
wire CPUVIZ_is_bltu_a4;

// For |cpuviz$is_bne.
wire CPUVIZ_is_bne_a4;

// For |cpuviz$is_csrrc.
wire CPUVIZ_is_csrrc_a4;

// For |cpuviz$is_csrrci.
wire CPUVIZ_is_csrrci_a4;

// For |cpuviz$is_csrrs.
wire CPUVIZ_is_csrrs_a4;

// For |cpuviz$is_csrrsi.
wire CPUVIZ_is_csrrsi_a4;

// For |cpuviz$is_csrrw.
wire CPUVIZ_is_csrrw_a4;

// For |cpuviz$is_csrrwi.
wire CPUVIZ_is_csrrwi_a4;

// For |cpuviz$is_jal.
wire CPUVIZ_is_jal_a4;

// For |cpuviz$is_jalr.
wire CPUVIZ_is_jalr_a4;

// For |cpuviz$is_lb.
wire CPUVIZ_is_lb_a4;

// For |cpuviz$is_lbu.
wire CPUVIZ_is_lbu_a4;

// For |cpuviz$is_lh.
wire CPUVIZ_is_lh_a4;

// For |cpuviz$is_lhu.
wire CPUVIZ_is_lhu_a4;

// For |cpuviz$is_load.
wire CPUVIZ_is_load_a4;

// For |cpuviz$is_lui.
wire CPUVIZ_is_lui_a4;

// For |cpuviz$is_lw.
wire CPUVIZ_is_lw_a4;

// For |cpuviz$is_or.
wire CPUVIZ_is_or_a4;

// For |cpuviz$is_ori.
wire CPUVIZ_is_ori_a4;

// For |cpuviz$is_sb.
wire CPUVIZ_is_sb_a4;

// For |cpuviz$is_sh.
wire CPUVIZ_is_sh_a4;

// For |cpuviz$is_sll.
wire CPUVIZ_is_sll_a4;

// For |cpuviz$is_slli.
wire CPUVIZ_is_slli_a4;

// For |cpuviz$is_slt.
wire CPUVIZ_is_slt_a4;

// For |cpuviz$is_slti.
wire CPUVIZ_is_slti_a4;

// For |cpuviz$is_sltiu.
wire CPUVIZ_is_sltiu_a4;

// For |cpuviz$is_sltu.
wire CPUVIZ_is_sltu_a4;

// For |cpuviz$is_sra.
wire CPUVIZ_is_sra_a4;

// For |cpuviz$is_srai.
wire CPUVIZ_is_srai_a4;

// For |cpuviz$is_srl.
wire CPUVIZ_is_srl_a4;

// For |cpuviz$is_srli.
wire CPUVIZ_is_srli_a4;

// For |cpuviz$is_store.
wire CPUVIZ_is_store_a4;

// For |cpuviz$is_sub.
wire CPUVIZ_is_sub_a4;

// For |cpuviz$is_sw.
wire CPUVIZ_is_sw_a4;

// For |cpuviz$is_xor.
wire CPUVIZ_is_xor_a4;

// For |cpuviz$is_xori.
wire CPUVIZ_is_xori_a4;

// For |cpuviz$mnemonic.
wire [10*8-1:0] CPUVIZ_mnemonic_a4;

// For |cpuviz$pc.
wire [31:0] CPUVIZ_pc_a4;

// For |cpuviz$rd.
wire [4:0] CPUVIZ_rd_a4;

// For |cpuviz$rd_valid.
wire CPUVIZ_rd_valid_a4;

// For |cpuviz$result.
wire [31:0] CPUVIZ_result_a4;

// For |cpuviz$rs1.
wire [4:0] CPUVIZ_rs1_a4;

// For |cpuviz$rs1_valid.
wire CPUVIZ_rs1_valid_a4;

// For |cpuviz$rs2.
wire [4:0] CPUVIZ_rs2_a4;

// For |cpuviz$rs2_valid.
wire CPUVIZ_rs2_valid_a4;

// For |cpuviz$src1_value.
wire [31:0] CPUVIZ_src1_value_a4;

// For |cpuviz$src2_value.
wire [31:0] CPUVIZ_src2_value_a4;

// For |cpuviz$valid.
wire CPUVIZ_valid_a4;

// For |cpuviz/defaults$dummy.
wire [0:0] CPUVIZ_Defaults_dummy_a0;

// For |cpuviz/defaults$imem_rd_addr.
wire [4-1:0] CPUVIZ_Defaults_imem_rd_addr_a0;

// For |cpuviz/defaults$imem_rd_en.
wire CPUVIZ_Defaults_imem_rd_en_a0;

// For |cpuviz/defaults$imm.
wire [31:0] CPUVIZ_Defaults_imm_a0;

// For |cpuviz/defaults$is_add.
wire CPUVIZ_Defaults_is_add_a0;

// For |cpuviz/defaults$is_addi.
wire CPUVIZ_Defaults_is_addi_a0;

// For |cpuviz/defaults$is_and.
wire CPUVIZ_Defaults_is_and_a0;

// For |cpuviz/defaults$is_andi.
wire CPUVIZ_Defaults_is_andi_a0;

// For |cpuviz/defaults$is_auipc.
wire CPUVIZ_Defaults_is_auipc_a0;

// For |cpuviz/defaults$is_beq.
wire CPUVIZ_Defaults_is_beq_a0;

// For |cpuviz/defaults$is_bge.
wire CPUVIZ_Defaults_is_bge_a0;

// For |cpuviz/defaults$is_bgeu.
wire CPUVIZ_Defaults_is_bgeu_a0;

// For |cpuviz/defaults$is_blt.
wire CPUVIZ_Defaults_is_blt_a0;

// For |cpuviz/defaults$is_bltu.
wire CPUVIZ_Defaults_is_bltu_a0;

// For |cpuviz/defaults$is_bne.
wire CPUVIZ_Defaults_is_bne_a0;

// For |cpuviz/defaults$is_csrrc.
wire CPUVIZ_Defaults_is_csrrc_a0;

// For |cpuviz/defaults$is_csrrci.
wire CPUVIZ_Defaults_is_csrrci_a0;

// For |cpuviz/defaults$is_csrrs.
wire CPUVIZ_Defaults_is_csrrs_a0;

// For |cpuviz/defaults$is_csrrsi.
wire CPUVIZ_Defaults_is_csrrsi_a0;

// For |cpuviz/defaults$is_csrrw.
wire CPUVIZ_Defaults_is_csrrw_a0;

// For |cpuviz/defaults$is_csrrwi.
wire CPUVIZ_Defaults_is_csrrwi_a0;

// For |cpuviz/defaults$is_jal.
wire CPUVIZ_Defaults_is_jal_a0;

// For |cpuviz/defaults$is_jalr.
wire CPUVIZ_Defaults_is_jalr_a0;

// For |cpuviz/defaults$is_lb.
wire CPUVIZ_Defaults_is_lb_a0;

// For |cpuviz/defaults$is_lbu.
wire CPUVIZ_Defaults_is_lbu_a0;

// For |cpuviz/defaults$is_lh.
wire CPUVIZ_Defaults_is_lh_a0;

// For |cpuviz/defaults$is_lhu.
wire CPUVIZ_Defaults_is_lhu_a0;

// For |cpuviz/defaults$is_load.
wire CPUVIZ_Defaults_is_load_a0;

// For |cpuviz/defaults$is_lui.
wire CPUVIZ_Defaults_is_lui_a0;

// For |cpuviz/defaults$is_lw.
wire CPUVIZ_Defaults_is_lw_a0;

// For |cpuviz/defaults$is_or.
wire CPUVIZ_Defaults_is_or_a0;

// For |cpuviz/defaults$is_ori.
wire CPUVIZ_Defaults_is_ori_a0;

// For |cpuviz/defaults$is_s_instr.
wire CPUVIZ_Defaults_is_s_instr_a0;

// For |cpuviz/defaults$is_sb.
wire CPUVIZ_Defaults_is_sb_a0;

// For |cpuviz/defaults$is_sh.
wire CPUVIZ_Defaults_is_sh_a0;

// For |cpuviz/defaults$is_sll.
wire CPUVIZ_Defaults_is_sll_a0;

// For |cpuviz/defaults$is_slli.
wire CPUVIZ_Defaults_is_slli_a0;

// For |cpuviz/defaults$is_slt.
wire CPUVIZ_Defaults_is_slt_a0;

// For |cpuviz/defaults$is_slti.
wire CPUVIZ_Defaults_is_slti_a0;

// For |cpuviz/defaults$is_sltiu.
wire CPUVIZ_Defaults_is_sltiu_a0;

// For |cpuviz/defaults$is_sltu.
wire CPUVIZ_Defaults_is_sltu_a0;

// For |cpuviz/defaults$is_sra.
wire CPUVIZ_Defaults_is_sra_a0;

// For |cpuviz/defaults$is_srai.
wire CPUVIZ_Defaults_is_srai_a0;

// For |cpuviz/defaults$is_srl.
wire CPUVIZ_Defaults_is_srl_a0;

// For |cpuviz/defaults$is_srli.
wire CPUVIZ_Defaults_is_srli_a0;

// For |cpuviz/defaults$is_store.
wire CPUVIZ_Defaults_is_store_a0;

// For |cpuviz/defaults$is_sub.
wire CPUVIZ_Defaults_is_sub_a0;

// For |cpuviz/defaults$is_sw.
wire CPUVIZ_Defaults_is_sw_a0;

// For |cpuviz/defaults$is_xor.
wire CPUVIZ_Defaults_is_xor_a0;

// For |cpuviz/defaults$is_xori.
wire CPUVIZ_Defaults_is_xori_a0;

// For |cpuviz/defaults$ld_data.
wire [31:0] CPUVIZ_Defaults_ld_data_a0;

// For |cpuviz/defaults$pc.
wire [31:0] CPUVIZ_Defaults_pc_a0;

// For |cpuviz/defaults$rd.
wire [4:0] CPUVIZ_Defaults_rd_a0;

// For |cpuviz/defaults$rd_valid.
wire CPUVIZ_Defaults_rd_valid_a0;

// For |cpuviz/defaults$result.
wire [31:0] CPUVIZ_Defaults_result_a0;

// For |cpuviz/defaults$rf_rd_en1.
wire CPUVIZ_Defaults_rf_rd_en1_a0;

// For |cpuviz/defaults$rf_rd_en2.
wire CPUVIZ_Defaults_rf_rd_en2_a0;

// For |cpuviz/defaults$rf_rd_index1.
wire [4:0] CPUVIZ_Defaults_rf_rd_index1_a0;

// For |cpuviz/defaults$rf_rd_index2.
wire [4:0] CPUVIZ_Defaults_rf_rd_index2_a0;

// For |cpuviz/defaults$rf_wr_data.
wire [31:0] CPUVIZ_Defaults_rf_wr_data_a0;

// For |cpuviz/defaults$rf_wr_en.
wire CPUVIZ_Defaults_rf_wr_en_a0;

// For |cpuviz/defaults$rf_wr_index.
wire [4:0] CPUVIZ_Defaults_rf_wr_index_a0;

// For |cpuviz/defaults$rs1.
wire [4:0] CPUVIZ_Defaults_rs1_a0;

// For |cpuviz/defaults$rs1_valid.
wire CPUVIZ_Defaults_rs1_valid_a0;

// For |cpuviz/defaults$rs2.
wire [4:0] CPUVIZ_Defaults_rs2_a0;

// For |cpuviz/defaults$rs2_valid.
wire CPUVIZ_Defaults_rs2_valid_a0;

// For |cpuviz/defaults$src1_value.
wire [31:0] CPUVIZ_Defaults_src1_value_a0;

// For |cpuviz/defaults$src2_value.
wire [31:0] CPUVIZ_Defaults_src2_value_a0;

// For |cpuviz/defaults$valid.
wire CPUVIZ_Defaults_valid_a0;


//
// Scope: |cpu
//

// Clock signals.
wire clkP_CPU_dmem_rd_en_a5 ;
wire clkP_CPU_rd_valid_a2 ;
wire clkP_CPU_rd_valid_a3 ;
wire clkP_CPU_rd_valid_a4 ;
wire clkP_CPU_rd_valid_a5 ;
wire clkP_CPU_rs1_valid_a2 ;
wire clkP_CPU_rs1_valid_a3 ;
wire clkP_CPU_rs1_valid_a4 ;
wire clkP_CPU_rs2_valid_a2 ;
wire clkP_CPU_rs2_valid_a3 ;
wire clkP_CPU_rs2_valid_a4 ;


generate


   //
   // Scope: |cpu
   //

      // For $br_tgt_pc.
      always @(posedge clk) CPU_br_tgt_pc_a3[31:0] <= CPU_br_tgt_pc_a2[31:0];

      // For $dmem_rd_data.
      always @(posedge clkP_CPU_dmem_rd_en_a5) CPU_dmem_rd_data_a5[31:0] <= CPU_dmem_rd_data_a4[31:0];

      // This is an unconditioned version of the condition signal.
      assign CPU_g0_rf_rd_en1_a2 = CPU_rf_rd_en1_a2 && CPU_rs1_valid_a2;

      // This is an unconditioned version of the condition signal.
      assign CPU_g1_rf_rd_en2_a2 = CPU_rf_rd_en2_a2 && CPU_rs2_valid_a2;

      // For $imem_rd_addr.
      always @(posedge clk) CPU_imem_rd_addr_a1[4-1:0] <= CPU_imem_rd_addr_a0[4-1:0];

      // For $imem_rd_en.
      always @(posedge clk) CPU_imem_rd_en_a1 <= CPU_imem_rd_en_a0;

      // For $imm.
      always @(posedge clk) CPU_imm_a2[31:0] <= CPU_imm_a1[31:0];
      always @(posedge clk) CPU_imm_a3[31:0] <= CPU_imm_a2[31:0];
      always @(posedge clk) CPU_imm_a4[31:0] <= CPU_imm_a3[31:0];

      // For $inc_pc.
      always @(posedge clk) CPU_inc_pc_a2[31:0] <= CPU_inc_pc_a1[31:0];
      always @(posedge clk) CPU_inc_pc_a3[31:0] <= CPU_inc_pc_a2[31:0];

      // For $is_add.
      always @(posedge clk) CPU_is_add_a2 <= CPU_is_add_a1;
      always @(posedge clk) CPU_is_add_a3 <= CPU_is_add_a2;
      always @(posedge clk) CPU_is_add_a4 <= CPU_is_add_a3;

      // For $is_addi.
      always @(posedge clk) CPU_is_addi_a2 <= CPU_is_addi_a1;
      always @(posedge clk) CPU_is_addi_a3 <= CPU_is_addi_a2;
      always @(posedge clk) CPU_is_addi_a4 <= CPU_is_addi_a3;

      // For $is_and.
      always @(posedge clk) CPU_is_and_a2 <= CPU_is_and_a1;
      always @(posedge clk) CPU_is_and_a3 <= CPU_is_and_a2;
      always @(posedge clk) CPU_is_and_a4 <= CPU_is_and_a3;

      // For $is_andi.
      always @(posedge clk) CPU_is_andi_a2 <= CPU_is_andi_a1;
      always @(posedge clk) CPU_is_andi_a3 <= CPU_is_andi_a2;
      always @(posedge clk) CPU_is_andi_a4 <= CPU_is_andi_a3;

      // For $is_auipc.
      always @(posedge clk) CPU_is_auipc_a2 <= CPU_is_auipc_a1;
      always @(posedge clk) CPU_is_auipc_a3 <= CPU_is_auipc_a2;
      always @(posedge clk) CPU_is_auipc_a4 <= CPU_is_auipc_a3;

      // For $is_beq.
      always @(posedge clk) CPU_is_beq_a2 <= CPU_is_beq_a1;
      always @(posedge clk) CPU_is_beq_a3 <= CPU_is_beq_a2;
      always @(posedge clk) CPU_is_beq_a4 <= CPU_is_beq_a3;

      // For $is_bge.
      always @(posedge clk) CPU_is_bge_a2 <= CPU_is_bge_a1;
      always @(posedge clk) CPU_is_bge_a3 <= CPU_is_bge_a2;
      always @(posedge clk) CPU_is_bge_a4 <= CPU_is_bge_a3;

      // For $is_bgeu.
      always @(posedge clk) CPU_is_bgeu_a2 <= CPU_is_bgeu_a1;
      always @(posedge clk) CPU_is_bgeu_a3 <= CPU_is_bgeu_a2;
      always @(posedge clk) CPU_is_bgeu_a4 <= CPU_is_bgeu_a3;

      // For $is_blt.
      always @(posedge clk) CPU_is_blt_a2 <= CPU_is_blt_a1;
      always @(posedge clk) CPU_is_blt_a3 <= CPU_is_blt_a2;
      always @(posedge clk) CPU_is_blt_a4 <= CPU_is_blt_a3;

      // For $is_bltu.
      always @(posedge clk) CPU_is_bltu_a2 <= CPU_is_bltu_a1;
      always @(posedge clk) CPU_is_bltu_a3 <= CPU_is_bltu_a2;
      always @(posedge clk) CPU_is_bltu_a4 <= CPU_is_bltu_a3;

      // For $is_bne.
      always @(posedge clk) CPU_is_bne_a2 <= CPU_is_bne_a1;
      always @(posedge clk) CPU_is_bne_a3 <= CPU_is_bne_a2;
      always @(posedge clk) CPU_is_bne_a4 <= CPU_is_bne_a3;

      // For $is_csrrc.
      always @(posedge clk) CPU_is_csrrc_a1 <= CPU_is_csrrc_a0;
      always @(posedge clk) CPU_is_csrrc_a2 <= CPU_is_csrrc_a1;
      always @(posedge clk) CPU_is_csrrc_a3 <= CPU_is_csrrc_a2;
      always @(posedge clk) CPU_is_csrrc_a4 <= CPU_is_csrrc_a3;

      // For $is_csrrci.
      always @(posedge clk) CPU_is_csrrci_a1 <= CPU_is_csrrci_a0;
      always @(posedge clk) CPU_is_csrrci_a2 <= CPU_is_csrrci_a1;
      always @(posedge clk) CPU_is_csrrci_a3 <= CPU_is_csrrci_a2;
      always @(posedge clk) CPU_is_csrrci_a4 <= CPU_is_csrrci_a3;

      // For $is_csrrs.
      always @(posedge clk) CPU_is_csrrs_a1 <= CPU_is_csrrs_a0;
      always @(posedge clk) CPU_is_csrrs_a2 <= CPU_is_csrrs_a1;
      always @(posedge clk) CPU_is_csrrs_a3 <= CPU_is_csrrs_a2;
      always @(posedge clk) CPU_is_csrrs_a4 <= CPU_is_csrrs_a3;

      // For $is_csrrsi.
      always @(posedge clk) CPU_is_csrrsi_a1 <= CPU_is_csrrsi_a0;
      always @(posedge clk) CPU_is_csrrsi_a2 <= CPU_is_csrrsi_a1;
      always @(posedge clk) CPU_is_csrrsi_a3 <= CPU_is_csrrsi_a2;
      always @(posedge clk) CPU_is_csrrsi_a4 <= CPU_is_csrrsi_a3;

      // For $is_csrrw.
      always @(posedge clk) CPU_is_csrrw_a1 <= CPU_is_csrrw_a0;
      always @(posedge clk) CPU_is_csrrw_a2 <= CPU_is_csrrw_a1;
      always @(posedge clk) CPU_is_csrrw_a3 <= CPU_is_csrrw_a2;
      always @(posedge clk) CPU_is_csrrw_a4 <= CPU_is_csrrw_a3;

      // For $is_csrrwi.
      always @(posedge clk) CPU_is_csrrwi_a1 <= CPU_is_csrrwi_a0;
      always @(posedge clk) CPU_is_csrrwi_a2 <= CPU_is_csrrwi_a1;
      always @(posedge clk) CPU_is_csrrwi_a3 <= CPU_is_csrrwi_a2;
      always @(posedge clk) CPU_is_csrrwi_a4 <= CPU_is_csrrwi_a3;

      // For $is_jal.
      always @(posedge clk) CPU_is_jal_a2 <= CPU_is_jal_a1;
      always @(posedge clk) CPU_is_jal_a3 <= CPU_is_jal_a2;
      always @(posedge clk) CPU_is_jal_a4 <= CPU_is_jal_a3;

      // For $is_jalr.
      always @(posedge clk) CPU_is_jalr_a2 <= CPU_is_jalr_a1;
      always @(posedge clk) CPU_is_jalr_a3 <= CPU_is_jalr_a2;
      always @(posedge clk) CPU_is_jalr_a4 <= CPU_is_jalr_a3;

      // For $is_lb.
      always @(posedge clk) CPU_is_lb_a1 <= CPU_is_lb_a0;
      always @(posedge clk) CPU_is_lb_a2 <= CPU_is_lb_a1;
      always @(posedge clk) CPU_is_lb_a3 <= CPU_is_lb_a2;
      always @(posedge clk) CPU_is_lb_a4 <= CPU_is_lb_a3;

      // For $is_lbu.
      always @(posedge clk) CPU_is_lbu_a1 <= CPU_is_lbu_a0;
      always @(posedge clk) CPU_is_lbu_a2 <= CPU_is_lbu_a1;
      always @(posedge clk) CPU_is_lbu_a3 <= CPU_is_lbu_a2;
      always @(posedge clk) CPU_is_lbu_a4 <= CPU_is_lbu_a3;

      // For $is_lh.
      always @(posedge clk) CPU_is_lh_a1 <= CPU_is_lh_a0;
      always @(posedge clk) CPU_is_lh_a2 <= CPU_is_lh_a1;
      always @(posedge clk) CPU_is_lh_a3 <= CPU_is_lh_a2;
      always @(posedge clk) CPU_is_lh_a4 <= CPU_is_lh_a3;

      // For $is_lhu.
      always @(posedge clk) CPU_is_lhu_a1 <= CPU_is_lhu_a0;
      always @(posedge clk) CPU_is_lhu_a2 <= CPU_is_lhu_a1;
      always @(posedge clk) CPU_is_lhu_a3 <= CPU_is_lhu_a2;
      always @(posedge clk) CPU_is_lhu_a4 <= CPU_is_lhu_a3;

      // For $is_load.
      always @(posedge clk) CPU_is_load_a2 <= CPU_is_load_a1;
      always @(posedge clk) CPU_is_load_a3 <= CPU_is_load_a2;
      always @(posedge clk) CPU_is_load_a4 <= CPU_is_load_a3;

      // For $is_lui.
      always @(posedge clk) CPU_is_lui_a2 <= CPU_is_lui_a1;
      always @(posedge clk) CPU_is_lui_a3 <= CPU_is_lui_a2;
      always @(posedge clk) CPU_is_lui_a4 <= CPU_is_lui_a3;

      // For $is_lw.
      always @(posedge clk) CPU_is_lw_a1 <= CPU_is_lw_a0;
      always @(posedge clk) CPU_is_lw_a2 <= CPU_is_lw_a1;
      always @(posedge clk) CPU_is_lw_a3 <= CPU_is_lw_a2;
      always @(posedge clk) CPU_is_lw_a4 <= CPU_is_lw_a3;

      // For $is_or.
      always @(posedge clk) CPU_is_or_a2 <= CPU_is_or_a1;
      always @(posedge clk) CPU_is_or_a3 <= CPU_is_or_a2;
      always @(posedge clk) CPU_is_or_a4 <= CPU_is_or_a3;

      // For $is_ori.
      always @(posedge clk) CPU_is_ori_a2 <= CPU_is_ori_a1;
      always @(posedge clk) CPU_is_ori_a3 <= CPU_is_ori_a2;
      always @(posedge clk) CPU_is_ori_a4 <= CPU_is_ori_a3;

      // For $is_s_instr.
      always @(posedge clk) CPU_is_s_instr_a2 <= CPU_is_s_instr_a1;
      always @(posedge clk) CPU_is_s_instr_a3 <= CPU_is_s_instr_a2;
      always @(posedge clk) CPU_is_s_instr_a4 <= CPU_is_s_instr_a3;

      // For $is_sb.
      always @(posedge clk) CPU_is_sb_a2 <= CPU_is_sb_a1;
      always @(posedge clk) CPU_is_sb_a3 <= CPU_is_sb_a2;
      always @(posedge clk) CPU_is_sb_a4 <= CPU_is_sb_a3;

      // For $is_sh.
      always @(posedge clk) CPU_is_sh_a2 <= CPU_is_sh_a1;
      always @(posedge clk) CPU_is_sh_a3 <= CPU_is_sh_a2;
      always @(posedge clk) CPU_is_sh_a4 <= CPU_is_sh_a3;

      // For $is_sll.
      always @(posedge clk) CPU_is_sll_a2 <= CPU_is_sll_a1;
      always @(posedge clk) CPU_is_sll_a3 <= CPU_is_sll_a2;
      always @(posedge clk) CPU_is_sll_a4 <= CPU_is_sll_a3;

      // For $is_slli.
      always @(posedge clk) CPU_is_slli_a2 <= CPU_is_slli_a1;
      always @(posedge clk) CPU_is_slli_a3 <= CPU_is_slli_a2;
      always @(posedge clk) CPU_is_slli_a4 <= CPU_is_slli_a3;

      // For $is_slt.
      always @(posedge clk) CPU_is_slt_a2 <= CPU_is_slt_a1;
      always @(posedge clk) CPU_is_slt_a3 <= CPU_is_slt_a2;
      always @(posedge clk) CPU_is_slt_a4 <= CPU_is_slt_a3;

      // For $is_slti.
      always @(posedge clk) CPU_is_slti_a2 <= CPU_is_slti_a1;
      always @(posedge clk) CPU_is_slti_a3 <= CPU_is_slti_a2;
      always @(posedge clk) CPU_is_slti_a4 <= CPU_is_slti_a3;

      // For $is_sltiu.
      always @(posedge clk) CPU_is_sltiu_a2 <= CPU_is_sltiu_a1;
      always @(posedge clk) CPU_is_sltiu_a3 <= CPU_is_sltiu_a2;
      always @(posedge clk) CPU_is_sltiu_a4 <= CPU_is_sltiu_a3;

      // For $is_sltu.
      always @(posedge clk) CPU_is_sltu_a2 <= CPU_is_sltu_a1;
      always @(posedge clk) CPU_is_sltu_a3 <= CPU_is_sltu_a2;
      always @(posedge clk) CPU_is_sltu_a4 <= CPU_is_sltu_a3;

      // For $is_sra.
      always @(posedge clk) CPU_is_sra_a2 <= CPU_is_sra_a1;
      always @(posedge clk) CPU_is_sra_a3 <= CPU_is_sra_a2;
      always @(posedge clk) CPU_is_sra_a4 <= CPU_is_sra_a3;

      // For $is_srai.
      always @(posedge clk) CPU_is_srai_a2 <= CPU_is_srai_a1;
      always @(posedge clk) CPU_is_srai_a3 <= CPU_is_srai_a2;
      always @(posedge clk) CPU_is_srai_a4 <= CPU_is_srai_a3;

      // For $is_srl.
      always @(posedge clk) CPU_is_srl_a2 <= CPU_is_srl_a1;
      always @(posedge clk) CPU_is_srl_a3 <= CPU_is_srl_a2;
      always @(posedge clk) CPU_is_srl_a4 <= CPU_is_srl_a3;

      // For $is_srli.
      always @(posedge clk) CPU_is_srli_a2 <= CPU_is_srli_a1;
      always @(posedge clk) CPU_is_srli_a3 <= CPU_is_srli_a2;
      always @(posedge clk) CPU_is_srli_a4 <= CPU_is_srli_a3;

      // For $is_store.
      always @(posedge clk) CPU_is_store_a1 <= CPU_is_store_a0;
      always @(posedge clk) CPU_is_store_a2 <= CPU_is_store_a1;
      always @(posedge clk) CPU_is_store_a3 <= CPU_is_store_a2;
      always @(posedge clk) CPU_is_store_a4 <= CPU_is_store_a3;

      // For $is_sub.
      always @(posedge clk) CPU_is_sub_a2 <= CPU_is_sub_a1;
      always @(posedge clk) CPU_is_sub_a3 <= CPU_is_sub_a2;
      always @(posedge clk) CPU_is_sub_a4 <= CPU_is_sub_a3;

      // For $is_sw.
      always @(posedge clk) CPU_is_sw_a2 <= CPU_is_sw_a1;
      always @(posedge clk) CPU_is_sw_a3 <= CPU_is_sw_a2;
      always @(posedge clk) CPU_is_sw_a4 <= CPU_is_sw_a3;

      // For $is_xor.
      always @(posedge clk) CPU_is_xor_a2 <= CPU_is_xor_a1;
      always @(posedge clk) CPU_is_xor_a3 <= CPU_is_xor_a2;
      always @(posedge clk) CPU_is_xor_a4 <= CPU_is_xor_a3;

      // For $is_xori.
      always @(posedge clk) CPU_is_xori_a2 <= CPU_is_xori_a1;
      always @(posedge clk) CPU_is_xori_a3 <= CPU_is_xori_a2;
      always @(posedge clk) CPU_is_xori_a4 <= CPU_is_xori_a3;

      // For $jalr_tgt_pc.
      always @(posedge clk) CPU_jalr_tgt_pc_a3[31:0] <= CPU_jalr_tgt_pc_a2[31:0];

      // For $pc.
      always @(posedge clk) CPU_pc_a1[31:0] <= CPU_pc_a0[31:0];
      always @(posedge clk) CPU_pc_a2[31:0] <= CPU_pc_a1[31:0];
      always @(posedge clk) CPU_pc_a3[31:0] <= CPU_pc_a2[31:0];
      always @(posedge clk) CPU_pc_a4[31:0] <= CPU_pc_a3[31:0];

      // For $rd.
      always @(posedge clkP_CPU_rd_valid_a2) CPU_rd_a2[4:0] <= CPU_rd_a1[4:0];
      always @(posedge clkP_CPU_rd_valid_a3) CPU_rd_a3[4:0] <= CPU_rd_a2[4:0];
      always @(posedge clkP_CPU_rd_valid_a4) CPU_rd_a4[4:0] <= CPU_rd_a3[4:0];
      always @(posedge clkP_CPU_rd_valid_a5) CPU_rd_a5[4:0] <= CPU_rd_a4[4:0];

      // For $rd_valid.
      always @(posedge clk) CPU_rd_valid_a2 <= CPU_rd_valid_a1;
      always @(posedge clk) CPU_rd_valid_a3 <= CPU_rd_valid_a2;
      always @(posedge clk) CPU_rd_valid_a4 <= CPU_rd_valid_a3;

      // For $reset.
      always @(posedge clk) CPU_reset_a1 <= CPU_reset_a0;
      always @(posedge clk) CPU_reset_a2 <= CPU_reset_a1;
      always @(posedge clk) CPU_reset_a3 <= CPU_reset_a2;
      always @(posedge clk) CPU_reset_a4 <= CPU_reset_a3;

      // For $result.
      always @(posedge clk) CPU_result_a4[31:0] <= CPU_result_a3[31:0];

      // For $rs1.
      always @(posedge clkP_CPU_rs1_valid_a2) CPU_rs1_a2[4:0] <= CPU_rs1_a1[4:0];
      always @(posedge clkP_CPU_rs1_valid_a3) CPU_rs1_a3[4:0] <= CPU_rs1_a2[4:0];
      always @(posedge clkP_CPU_rs1_valid_a4) CPU_rs1_a4[4:0] <= CPU_rs1_a3[4:0];

      // For $rs1_valid.
      always @(posedge clk) CPU_rs1_valid_a2 <= CPU_rs1_valid_a1;
      always @(posedge clk) CPU_rs1_valid_a3 <= CPU_rs1_valid_a2;
      always @(posedge clk) CPU_rs1_valid_a4 <= CPU_rs1_valid_a3;

      // For $rs2.
      always @(posedge clkP_CPU_rs2_valid_a2) CPU_rs2_a2[4:0] <= CPU_rs2_a1[4:0];
      always @(posedge clkP_CPU_rs2_valid_a3) CPU_rs2_a3[4:0] <= CPU_rs2_a2[4:0];
      always @(posedge clkP_CPU_rs2_valid_a4) CPU_rs2_a4[4:0] <= CPU_rs2_a3[4:0];

      // For $rs2_valid.
      always @(posedge clk) CPU_rs2_valid_a2 <= CPU_rs2_valid_a1;
      always @(posedge clk) CPU_rs2_valid_a3 <= CPU_rs2_valid_a2;
      always @(posedge clk) CPU_rs2_valid_a4 <= CPU_rs2_valid_a3;

      // For $src1_value.
      always @(posedge clkP_CPU_rs1_valid_a3) CPU_src1_value_a3[31:0] <= CPU_src1_value_a2[31:0];
      always @(posedge clkP_CPU_rs1_valid_a4) CPU_src1_value_a4[31:0] <= CPU_src1_value_a3[31:0];

      // For $src2_value.
      always @(posedge clkP_CPU_rs2_valid_a3) CPU_src2_value_a3[31:0] <= CPU_src2_value_a2[31:0];
      always @(posedge clkP_CPU_rs2_valid_a4) CPU_src2_value_a4[31:0] <= CPU_src2_value_a3[31:0];

      // For $valid.
      always @(posedge clk) CPU_valid_a4 <= CPU_valid_a3;

      // For $valid_jump.
      always @(posedge clk) CPU_valid_jump_a4 <= CPU_valid_jump_a3;
      always @(posedge clk) CPU_valid_jump_a5 <= CPU_valid_jump_a4;

      // For $valid_load.
      always @(posedge clk) CPU_valid_load_a4 <= CPU_valid_load_a3;
      always @(posedge clk) CPU_valid_load_a5 <= CPU_valid_load_a4;

      // For $valid_taken_br.
      always @(posedge clk) CPU_valid_taken_br_a4 <= CPU_valid_taken_br_a3;
      always @(posedge clk) CPU_valid_taken_br_a5 <= CPU_valid_taken_br_a4;


      //
      // Scope: /dmem[15:0]
      //
      for (dmem = 0; dmem <= 15; dmem=dmem+1) begin : L1gen_CPU_Dmem
         // For $dummy.
         always @(posedge clk) L1b_CPU_Dmem[dmem].L1_dummy_a1[0:0] <= L1b_CPU_Dmem[dmem].L1_dummy_a0[0:0];
         always @(posedge clk) L1b_CPU_Dmem[dmem].L1_dummy_a2[0:0] <= L1b_CPU_Dmem[dmem].L1_dummy_a1[0:0];
         always @(posedge clk) L1b_CPU_Dmem[dmem].L1_dummy_a3[0:0] <= L1b_CPU_Dmem[dmem].L1_dummy_a2[0:0];
         always @(posedge clk) L1b_CPU_Dmem[dmem].L1_dummy_a4[0:0] <= L1b_CPU_Dmem[dmem].L1_dummy_a3[0:0];

         // For $value.
         always @(posedge clk) CPU_Dmem_value_a5[dmem][31:0] <= CPU_Dmem_value_a4[dmem][31:0];

      end

      //
      // Scope: /xreg[31:0]
      //
      for (xreg = 0; xreg <= 31; xreg=xreg+1) begin : L1gen_CPU_Xreg
         // For $dummy.
         always @(posedge clk) L1b_CPU_Xreg[xreg].L1_dummy_a1[0:0] <= L1b_CPU_Xreg[xreg].L1_dummy_a0[0:0];
         always @(posedge clk) L1b_CPU_Xreg[xreg].L1_dummy_a2[0:0] <= L1b_CPU_Xreg[xreg].L1_dummy_a1[0:0];
         always @(posedge clk) L1b_CPU_Xreg[xreg].L1_dummy_a3[0:0] <= L1b_CPU_Xreg[xreg].L1_dummy_a2[0:0];
         always @(posedge clk) L1b_CPU_Xreg[xreg].L1_dummy_a4[0:0] <= L1b_CPU_Xreg[xreg].L1_dummy_a3[0:0];

         // For $value.
         always @(posedge clk) CPU_Xreg_value_a4[xreg][31:0] <= CPU_Xreg_value_a3[xreg][31:0];

         // For $wr.
         always @(posedge clk) L1_CPU_Xreg[xreg].L1_wr_a4 <= L1_CPU_Xreg[xreg].L1_wr_a3;

      end


   //
   // Scope: |cpuviz
   //


      //
      // Scope: /dmem[15:0]
      //
      for (dmem = 0; dmem <= 15; dmem=dmem+1) begin : L1gen_CPUVIZ_Dmem
         // For $value.
         always @(posedge clk) L1_CPUVIZ_Dmem[dmem].L1_value_a5[31:0] <= L1_CPUVIZ_Dmem[dmem].L1_value_a4[31:0];

      end

      //
      // Scope: /xreg[31:0]
      //
      for (xreg = 0; xreg <= 31; xreg=xreg+1) begin : L1gen_CPUVIZ_Xreg
         // For $value.
         always @(posedge clk) L1_CPUVIZ_Xreg[xreg].L1_value_a5[31:0] <= L1_CPUVIZ_Xreg[xreg].L1_value_a4[31:0];

      end



endgenerate



//
// Gated clocks.
//

generate



   //
   // Scope: |cpu
   //

      clk_gate gen_clkP_CPU_dmem_rd_en_a5(clkP_CPU_dmem_rd_en_a5, clk, 1'b1, CPU_dmem_rd_en_a4, 1'b0);
      clk_gate gen_clkP_CPU_rd_valid_a2(clkP_CPU_rd_valid_a2, clk, 1'b1, CPU_rd_valid_a1, 1'b0);
      clk_gate gen_clkP_CPU_rd_valid_a3(clkP_CPU_rd_valid_a3, clk, 1'b1, CPU_rd_valid_a2, 1'b0);
      clk_gate gen_clkP_CPU_rd_valid_a4(clkP_CPU_rd_valid_a4, clk, 1'b1, CPU_rd_valid_a3, 1'b0);
      clk_gate gen_clkP_CPU_rd_valid_a5(clkP_CPU_rd_valid_a5, clk, 1'b1, CPU_rd_valid_a4, 1'b0);
      clk_gate gen_clkP_CPU_rs1_valid_a2(clkP_CPU_rs1_valid_a2, clk, 1'b1, CPU_rs1_valid_a1, 1'b0);
      clk_gate gen_clkP_CPU_rs1_valid_a3(clkP_CPU_rs1_valid_a3, clk, 1'b1, CPU_rs1_valid_a2, 1'b0);
      clk_gate gen_clkP_CPU_rs1_valid_a4(clkP_CPU_rs1_valid_a4, clk, 1'b1, CPU_rs1_valid_a3, 1'b0);
      clk_gate gen_clkP_CPU_rs2_valid_a2(clkP_CPU_rs2_valid_a2, clk, 1'b1, CPU_rs2_valid_a1, 1'b0);
      clk_gate gen_clkP_CPU_rs2_valid_a3(clkP_CPU_rs2_valid_a3, clk, 1'b1, CPU_rs2_valid_a2, 1'b0);
      clk_gate gen_clkP_CPU_rs2_valid_a4(clkP_CPU_rs2_valid_a4, clk, 1'b1, CPU_rs2_valid_a3, 1'b0);



endgenerate
