/**
 * 要素に動きをつける
 * @author m.miyahara
 */

// 動きのきっかけの起点となるアニメーションの名前を定義
function fadeAnime() {

    $('.smoothTrigger').each(function() { //smoothTriggerというクラス名が
        var elemPos = $(this).offset().top - 50; //要素より、50px上の
        var scroll = $(window).scrollTop();
        var windowHeight = $(window).height();
        if (scroll >= elemPos - windowHeight) {
            $(this).addClass('smooth'); // 画面内に入ったらsmoothというクラス名を追記
        } else {
            $(this).removeClass('smooth'); // 画面外に出たらsmoothというクラス名を外す
        }
    });

} // ここまでがfadeAnime()関数の定義

// 画面をスクロールをしたら動かしたい場合の記述
$(window).scroll(function() {
    fadeAnime(); /* アニメーション用の関数を呼ぶ*/
}); // ここまでが画面をスクロールをしたら動かしたい場合の記述

//scroll fix header menu設定
$(function () {
	"use strict";
	var flag = "view";

  $(window).on("scroll", function () {
    // scrollTop()が「200」より大きい場合
   //画面トップから、ナビゲーションメニューまでの高さ（ピクセル）を指定すれば、メニュースクロールで
   //消えていくタイミングでヘッダが表示されて固定される。  
    
    if ($(this).scrollTop() > 200) {
      if (flag === "view") {
        $(".fix-header").stop().css({opacity: '1.0'}).animate({
   //”▲.fix-header”の部分は固定ヘッダとして表示させるブロックのID名もしくはクラス名に
          top: 0
        }, 500);

        flag = "hide";
      }
    } else {
      if (flag === "hide") {
        $(".fix-header").stop().animate({top:"-66px",opacity: 0}, 500);
		//上にあがり切ったら透過度を0%にして背景が生きるように
        //”▲.fix-header”の部分は固定ヘッダとして表示させるブロックのID名もしくはクラス名に
        flag = "view";
      }
    }
  });
});
