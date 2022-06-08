import "the-new-css-reset";

import "./assets/styles/fonts.css";
import "./assets/styles/global.css";

import('./output/Main')
  .then((m) => m.main())
  .catch(console.log);
