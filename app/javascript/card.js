// window.addEventListener("load", () => {
//   Payjp.setPublicKey("pk_test_cd57ec7fef472b1a8e067545");
//   const form = document.getElementById("charge-form");
//   if (form !== null){
//     form.addEventListener("submit", (e) => {
//       e.preventDefault();

//       const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);

//     const card = {
//       number: formData.get("order[number]"),
//       cvc: formData.get("order[cvc]"),
//       exp_month: formData.get("order[exp_month]"),
//       exp_year: `20${formData.get("order[exp_year]")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       if (status == 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} name='token'>`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);
//       }

//       document.getElementById("order_number").removeAttribute("name");
//       document.getElementById("order_cvc").removeAttribute("name");
//       document.getElementById("order_exp_month").removeAttribute("name");
//       document.getElementById("order_exp_year").removeAttribute("name");

//       document.getElementById("charge-form").submit();
//     });

//     });
//   }
// });




// // const pay = () => {
// //   const form = document.getElementById("charge-form");
// //   form.addEventListener("submit", (e) => {
// //     e.preventDefault();
// //     console.log("フォーム送信時にイベント発火")
// //   });
// // };

// // window.addEventListener("load", pay);