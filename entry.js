import './src/styles/global.css';

import('./output/Main')
  .then((m) => m.main())
  .catch(console.log);
