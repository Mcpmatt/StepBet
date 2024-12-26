const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });

exports.handleCashout = functions.https.onRequest(async (req, res) => {
  // Wrap the entire function in cors handler
  return cors(req, res, async () => {
    try {
      if (req.method === "GET") {
        res
          .status(200)
          .json({
            message: "Cashout endpoint is working. Please use POST method.",
          });
        return;
      }

      const { uid, finalBalance, betsPlaced, totalBetAmount } = req.body;

      if (!uid || finalBalance === undefined) {
        throw new Error("Missing required parameters");
      }

      await admin
        .firestore()
        .collection("users")
        .doc(uid)
        .update({
          token_count: admin.firestore.FieldValue.increment(finalBalance),
          has_cashed_out: true,
          bets_placed: admin.firestore.FieldValue.increment(betsPlaced),
          total_bet_amount:
            admin.firestore.FieldValue.increment(totalBetAmount),
        });

      res.status(200).json({ success: true });
    } catch (error) {
      console.error("Cashout error:", error);
      res.status(500).json({ error: "Failed to process cashout" });
    }
  });
});

// To avoid deployment errors, do not call admin.initializeApp() in your code
