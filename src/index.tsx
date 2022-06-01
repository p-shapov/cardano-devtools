import React from 'react';
import * as ReactDOMClient from 'react-dom/client';
import { BrowserRouter as Router } from 'react-router-dom';

import 'the-new-css-reset/css/reset.css';
import './styles/global.scss';

import { App } from './pages/app';

const container = document.getElementById('root');

if (container) {
  const root = ReactDOMClient.createRoot(container);

  root.render(
    <React.StrictMode>
      <Router>
        <App />
      </Router>
    </React.StrictMode>,
  );
}
