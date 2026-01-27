// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require trix
//= require scaffold
//= require_tree .

$(document).on("ready", function() {
  var editor = document.getElementById("editor");

  if (editor) {
    var simplemde = new SimpleMDE({ element: editor });
  }

  var $form = $("form.contact-us__form");

  var showPopup = function() {
    var $popUp = $(".pop-up");
    $popUp.addClass("pop-up--is-visible");
    setTimeout(function() {
      $popUp.removeClass("pop-up--is-visible");
    }, 3000);
  };

  $form.on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url: "https://formspree.io/mqkpznzr",
      data: $form.serialize(),
      method: "POST",
      dataType: "json"
    }).done(function(data) {
      showPopup();
      $form[0].reset();
    });
  });

  $(function() {
    var modal = $(".modal");
    var triggers = document.getElementsByClassName("trigger");
    var closeButton = $(".close-button");

    function toggleModal() {
      modal.toggleClass("show-modal");
    }

    for (var i = 0; i < triggers.length; i++) {
      triggers[i].addEventListener("click", toggleModal);
    }

    function windowOnClick(event) {
      if (event.target === modal[0]) {
        toggleModal();
      }
    }

    closeButton.on("click", toggleModal);
    window.addEventListener("click", windowOnClick);
  });

  $(".header")
    .find('a[href="' + window.location.pathname + '"]')
    .addClass("header__link--active");

  $(document).on("click", ".header__menu-icon", function(event) {
    var $menu = $(".header__menu");

    $menu.toggleClass("header__menu--active");
    if ($menu.hasClass("header__menu--active")) {
      $(".header__menu-icon svg").hide();
    } else {
      $(".header__menu-icon svg").show();
    }
  });

  $(".header__menu-burger").click(function(e) {
    $(".header__modal-block").addClass("active");
    var page = document.getElementsByClassName("page");
    page[0].style.overflow = "hidden";
    e.preventDefault();
  });

  $(".modal-block__close-button").click(function(e) {
    $(".header__modal-block").removeClass("active");
    var page = document.getElementsByClassName("page");
    page[0].style.overflow = "unset";
    e.preventDefault();
  });

  var language = document
    .querySelector('meta[name="language"]')
    .getAttribute("content");
  var words = [];

  switch (language) {
    case "ru":
      words = [
        "<span style='color: #2D8EBB;'>Производительные</span>",
        "<span style='color: #f0da50;'>Простые в использовании</span>",
        "<span style='color: #E82E4D;'>Надёжные</span>",
        "<span style='color: #75B066;'>Успешные</span>"
      ];
      break;
    case "de":
      words = [
        "<span style='color: #2D8EBB;'>Performant</span>",
        "<span style='color: #f0da50;'>User-friendly</span>",
        "<span style='color: #E82E4D;'>Reliable</span>",
        "<span style='color: #75B066;'>Successful</span>"
      ];
      break;
    default:
      words = [
        "<span style='color: #2D8EBB;'>Performant</span>",
        "<span style='color: #f0da50;'>User-friendly</span>",
        "<span style='color: #E82E4D;'>Reliable</span>",
        "<span style='color: #75B066;'>Successful</span>"
      ];
  }

  Typed.new(".page__text .page__typing", {
    strings: words,
    typeSpeed: 50,
    backDelay: 800
  });
});

// Our works
$(function() {
  var owl = $(".slider");

  owl.owlCarousel({
    items: 2.6,
    margin: 30,
    loop: true,
    nav: true,
    onInitialized: counter,
    onChanged: counter,
    autoplay: true,
    autoplayTimeout: 2500,
    autoplayHoverPause: true,
    smartSpeed: 2000,
    responsive: {
      //Адаптация в зависимости от разрешения экрана
      0: { items: 1.2 },
      450: { items: 1.2 },
      645: { items: 1.6 },
      992: { items: 2.2 },
      1600: { items: 2.6 }
    }
  });
  $(".slider-nav__next").click(function() {
    owl.trigger("next.owl.carousel", [300]);
    owl.trigger("stop.owl.autoplay");
  });
  $(".slider-nav__prev").click(function() {
    owl.trigger("prev.owl.carousel", [300]);
    owl.trigger("stop.owl.autoplay");
  });
  $(".slider-nav__next").mouseout(function() {
    owl.trigger("play.owl.autoplay");
  });
  $(".slider-nav__prev").mouseout(function() {
    owl.trigger("play.owl.autoplay");
  });

  function counter(event) {
    if (!event.namespace) {
      return;
    }
    var slides = event.relatedTarget;
    $(".slider__counter").text(
      slides.relative(slides.current()) + 1 + "/" + slides.items().length
    );
  }
});

// Feedbacks
$(function() {
  var feedback = $(".feedback-slider");

  feedback.owlCarousel({
    items: 1,
    stagePadding: -10,
    onInitialized: counter,
    onChanged: counter,
    autoplayHoverPause: true,
    loop: true, //Зацикливаем слайдер
    nav: true,
    autoplay: true, //Автозапуск слайдера
    smartSpeed: 1500, //Время движения слайда
    autoplayTimeout: 4000, //Время смены слайда
    autoplayHoverPause: true
  });
  $(".feedback-slider-nav__next").click(function() {
    feedback.trigger("next.owl.carousel", [300]);
    feedback.trigger("stop.owl.autoplay");
  });
  $(".feedback-slider-nav__prev").click(function() {
    feedback.trigger("prev.owl.carousel", [300]);
    feedback.trigger("stop.owl.autoplay");
  });
  $(".feedback-slider-nav__prev").mouseout(function() {
    feedback.trigger("play.owl.autoplay");
  });
  $(".feedback-slider-nav__next").mouseout(function() {
    feedback.trigger("play.owl.autoplay");
  });

  function counter(event) {
    if (!event.namespace) {
      return;
    }
    var slides = event.relatedTarget;
    $(".feedback-slider__counter").text(
      slides.relative(slides.current()) + 1 + "/" + slides.items().length
    );
  }
});

$(function() {
  var screenshots = $(".screenshots-examples");

  screenshots.owlCarousel({
    nav: true,
    smartSpeed: 900,
    margin: 10,
    loop: true,
    autoplay: true,
    stagePadding: 0,
    responsive: {
      0: {
        items: 1
      },
      764: {
        items: 2
      },
      1280: {
        items: 3
      }
    }
  });
  $(".screenshots-examples__next").click(function() {
    screenshots.trigger("next.owl.carousel", [300]);
    screenshots.trigger("stop.owl.autoplay");
  });
  $(".screenshots-examples__prev").click(function() {
    screenshots.trigger("prev.owl.carousel", [300]);
    screenshots.trigger("stop.owl.autoplay");
  });
  $(".screenshots-examples__prev").mouseout(function() {
    screenshots.trigger("play.owl.autoplay");
  });
  $(".screenshots-examples__next").mouseout(function() {
    screenshots.trigger("play.owl.autoplay");
  });

  screenshots.magnificPopup({
    delegate: ".owl-item a",
    type: "image",
    gallery: {
      enabled: true
    },
    image: {
      verticalFit: true
    }
  });
});

$(document).ready(function() {
  $(".collapse-item__header").click(function() {
    $(".upload-file")[0].style.display = "unset";
    $header = $(this);
    //getting the next element
    $content = $header.next();

    $svg = $header[0].children[1];
    if ($svg.style.transform === "rotate(180deg)") $svg.style.transform = "";
    else if ($svg.style.transform === "") {
      $svg.style.transform = "rotate(180deg)";
    }
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $content.slideToggle(400);
  });
});

$(function() {
  var sliderItems = $(".slider__item");

  for (var i = 0; i < sliderItems.length; i++) {
    var slideInfo = sliderItems[i].children[0];

    var headerHeight = slideInfo.getElementsByClassName("slide__header")[0]
      .clientHeight;

    slideInfo.style.top = "calc(100% - " + headerHeight + "px)";
    // = `calc(100% - ${headerHeight}px)`;
  }

  $(window).resize(function() {
    for (var i = 0; i < sliderItems.length; i++) {
      var slideInfo = sliderItems[i].children[0];

      var headerHeight = slideInfo.getElementsByClassName("slide__header")[0]
        .clientHeight;

      slideInfo.style.top = "calc(100% - " + headerHeight + "px)";
      // = `calc(100% - ${headerHeight}px)`;
    }
  });
});

$(function() {
  if ($(".testimonials__wrapper")[0]) {
    var feedbackWrapper = $(".testimonials__wrapper")[0];
    var feedbackHeader = $(".testimonials__header")[0];
    var feedbackBlock = $(".testimonials")[0];

    feedbackWrapper.style.marginTop =
      // `calc(-${window.getComputedStyle(feedbackBlock).marginTop} - ${feedbackHeader.clientHeight}px)`;
      "calc(-" +
      window.getComputedStyle(feedbackBlock).marginTop +
      " - " +
      feedbackHeader.clientHeight +
      "px)";

    $(window).resize(function() {
      feedbackWrapper.style.marginTop =
        // `calc(-${window.getComputedStyle(feedbackBlock).marginTop} - ${feedbackHeader.clientHeight}px)`;
        "calc(-" +
        window.getComputedStyle(feedbackBlock).marginTop +
        " - " +
        feedbackHeader.clientHeight +
        "px)";
    });
  }
});

$(function() {
  if ($(".sidenav__link")) {
    var arr = ["react", "php"];
    var links = $(".sidenav__link");

    for (var i = 0; i < arr.length; i++) {
      if (window.location.search.toLowerCase().includes(arr[i])) {
        $(links[++i]).addClass("active");
      } else if (
        window.location.search === "?locale=ru" ||
        window.location.search === "?locale=en"
      ) {
        $(links[0]).addClass("active");
      }
    }
  }
});
