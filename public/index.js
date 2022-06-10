import "the-new-css-reset";

import "./assets/styles/fonts.scss";
import "./assets/styles/global.scss";

import('../output/Main')
  .then((m) => m.main())
  .catch(console.log);
