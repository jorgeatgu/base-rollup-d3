!function(){var e=document.querySelector(".overlay"),c=document.querySelector(".navegacion"),o=document.querySelector("body"),t=document.querySelectorAll(".navegacion-btn"),l=document.querySelector(".burger");function r(){l.classList.toggle("clicked"),e.classList.toggle("show"),c.classList.toggle("show"),o.classList.toggle("overflow")}for(document.querySelector(".burger").addEventListener("click",r),document.querySelector(".overlay").addEventListener("click",r),i=0;i<t.length;i++)t[i].addEventListener("click",(function(){s(),console.log("click")}));function s(){e.classList.remove("show"),c.classList.remove("show"),l.classList.remove("clicked")}}();
