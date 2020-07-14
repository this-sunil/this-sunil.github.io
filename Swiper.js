  var swiper=new Swiper('.swiper-container',{
    effect:'coverflow',
    grabCursor:true,
    autoplay:true,
    centeredSlides:true,
    spaceBetween:20,
    coverflowEffect:{
      rotate:10,
      strech:0,
      depth:100,
      modifier:1,
      slideShadows:false,
    },
    pagination:{
      el:'.swiper-pagination',
    }
  });