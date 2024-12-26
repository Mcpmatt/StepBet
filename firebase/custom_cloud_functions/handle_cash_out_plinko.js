const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });

exports.handleCashOutPlinko = functions.https.onRequest(async (req, res) => {
  // Wrap the entire function in cors handler
  return cors(req, res, async () => {
    try {
      if (req.method === "GET") {
        res
          .status(200)
          .json({
            message:
              "Plinko cashout endpoint is working. Please use POST method.",
          });
        return;
      }

      const { uid, finalBalance, betsPlaced, totalBetAmount } = req.body;

      /* Add detailed logging
               Check FireBase Console logs for values
            console.log('Plinko Cashout Request Values:', {
                uid: uid,
                finalBalance: finalBalance,
                betsPlaced: betsPlaced,
                totalBetAmount: totalBetAmount,
                valueTypes: {
                    finalBalance: typeof finalBalance,
                    betsPlaced: typeof betsPlaced,
                    totalBetAmount: typeof totalBetAmount
                }
            });*/

      if (!uid || finalBalance === undefined) {
        throw new Error("Missing required parameters");
      }

      await admin
        .firestore()
        .collection("users")
        .doc(uid)
        .update({
          token_count: admin.firestore.FieldValue.increment(finalBalance),
          has_cashed_out_plinko: true,
          bets_placed: admin.firestore.FieldValue.increment(betsPlaced),
          total_bet_amount:
            admin.firestore.FieldValue.increment(totalBetAmount),
        });

      res.status(200).json({ success: true });
    } catch (error) {
      console.error("Plinko cashout error:", error);
      res.status(500).json({ error: "Failed to process Plinko cashout" });
    }
  });
});
// To avoid deployment errors, do not call admin.initializeApp() in your code
