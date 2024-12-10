import { getAuth, FacebookAuthProvider, signInWithPopup, fetchSignInMethodsForEmail, linkWithCredential } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";
import { app } from "./loginConfig.js"; 

const auth = getAuth(app);
const provider = new FacebookAuthProvider();

document.addEventListener("DOMContentLoaded", function () {
  const facebookLogin = document.getElementById("login-fb-btn");

  facebookLogin.addEventListener("click", function (event) {
    event.preventDefault();

    signInWithPopup(auth, provider)
      .then((result) => {
        console.log("Login successful");
        window.location.href = "/premierleague/home.jsp";
      })
      .catch((error) => {
        if (error.code === "auth/account-exists-with-different-credential") {
          const pendingCred = FacebookAuthProvider.credentialFromError(error);
          const email = error.customData.email;

          // Tìm phương thức đăng nhập khác
          fetchSignInMethodsForEmail(auth, email).then((methods) => {
            if (methods.includes("google.com")) {
              alert("Tài khoản này đã liên kết với Google. Vui lòng đăng nhập bằng Google trước.");

              // Hướng dẫn người dùng đăng nhập bằng Google
              signInWithPopup(auth, new GoogleAuthProvider())
                .then((result) => {
                  // Liên kết tài khoản Facebook với tài khoản Google
                  return linkWithCredential(result.user, pendingCred);
                })
                .then(() => {
                  window.location.href = "home.jsp";
                })
                .catch((linkError) => {
                  console.error("Error linking accounts:", linkError);
                  alert("Lỗi khi liên kết tài khoản.");
                });
            }
          });
        } else {
          console.error("Facebook Login Error:", error.message);
          alert("Facebook Login Error: " + error.message);
        }
      });
  });
});
