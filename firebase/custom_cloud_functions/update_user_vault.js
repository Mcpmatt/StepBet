const functions = require("firebase-functions");
const admin = require("firebase-admin");
const cors = require("cors")({ origin: true });
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.updateUserVault = functions.https.onRequest(async (req, res) => {
  return cors(req, res, async () => {
    try {
      if (req.method === "GET") {
        res
          .status(200)
          .json({
            message:
              "Vault update endpoint is working. Please use POST method.",
          });
        return;
      }

      const { uid, finalBalance, vaultValue } = req.body;
      console.log("Received parameters:", { uid, finalBalance, vaultValue });

      if (!uid || finalBalance === undefined || vaultValue === undefined) {
        console.error("Missing required parameters");
        throw new Error("Missing required parameters");
      }

      const userRef = admin.firestore().collection("users").doc(uid);
      console.log("Updating user document:", userRef.path);

      await userRef.update({
        token_count: finalBalance,
        vault_value: vaultValue,
      });

      console.log("User document updated successfully");
      res.status(200).json({ success: true });
    } catch (error) {
      console.error("Vault update error:", error);
      res.status(500).json({ error: "Failed to update vault" });
    }
  });
});
