import { getAuth, GoogleAuthProvider, signInWithPopup } from "https://www.gstatic.com/firebasejs/11.0.2/firebase-auth.js";
import { app } from "./loginConfig.js"; // Import cấu hình Firebase từ file chung

const auth = getAuth(app);
auth.languageCode = 'en';
const provider = new GoogleAuthProvider();

document.addEventListener("DOMContentLoaded", function() {
  const googleLogin = document.getElementById("google-google-btn");

  googleLogin.addEventListener("click", function() {
    signInWithPopup(auth, provider)
      .then((result) => {
        const user = result.user;
        console.log("User details:", user);

        sessionStorage.setItem("user", JSON.stringify(user)); // Lưu thông tin người dùng

        window.location.href = "home.jsp"; // Chuyển hướng sau khi đăng nhập
      })
      .catch((error) => {
        console.error("Google Login Error: ", error.message);
        alert("Google Login Error: " + error.message);
      });
  });
});
