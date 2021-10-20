import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "Make yourself happier"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };