const admin = require("firebase-admin/app");
admin.initializeApp();

const handleCashout = require("./handle_cashout.js");
exports.handleCashout = handleCashout.handleCashout;
const handleCashOutPlinko = require("./handle_cash_out_plinko.js");
exports.handleCashOutPlinko = handleCashOutPlinko.handleCashOutPlinko;
const updateUserVault = require("./update_user_vault.js");
exports.updateUserVault = updateUserVault.updateUserVault;
