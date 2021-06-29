// const tabs = document.querySelectorAll(".tabs li a");
// const contents = document.querySelectorAll(".contents li ");

// console.log(tabs);
// console.log(contents);

// for (let i = 0; i < tabs.length; i++) {
// tabs[i].addEventListener("click", function(e) {
//     e.preventDefault();

//     for (let j = 0; j < tabs.length; j++) {
//         tabs[j].classList.remove["active"];
//     }
//     for (let j = 0; j < contents.length; j++) {
//         contents[j].classList.remove["active"];
//     }

//     this.classList.add("active");
//     contents[i].classList.add("active");
// });  
// }

document.addEventListener('DOMContentLoaded', function(){
    // タブに対してクリックイベントを適用
    const tabs = document.getElementsByClassName('tab');
    for(let i = 0; i < tabs.length; i++) {
      tabs[i].addEventListener('click', tabSwitch);
    }
  
    // タブをクリックすると実行する関数
    function tabSwitch(){
      // タブのclassの値を変更
      document.getElementsByClassName('is-active')[0].classList.remove('is-active');
      this.classList.add('is-active');
      // コンテンツのclassの値を変更
      document.getElementsByClassName('is-show')[0].classList.remove('is-show');
      const arrayTabs = Array.prototype.slice.call(tabs);
      const index = arrayTabs.indexOf(this);
      document.getElementsByClassName('panel')[index].classList.add('is-show');
    };
  });