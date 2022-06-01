import React from 'react';
import * as ReactDOMClient from 'react-dom/client';
import { BrowserRouter as Router } from 'react-router-dom';
import { ThemeProvider } from '@mui/material';
import { ThemeProvider as SCThemeProvide, StyleSheetManager } from 'styled-components';
import 'normalize.css';

import { themes } from 'shared/theme';
import { FixedGlobalStyle, ThemedGlobalStyle } from 'shared/styles/global.styles';

import { App } from './pages/app';

const container = document.getElementById('root');

if (container) {
  const root = ReactDOMClient.createRoot(container);
  root.render(
    <React.StrictMode>
      <FixedGlobalStyle />
      <StyleSheetManager disableVendorPrefixes={process.env.NODE_ENV === 'development'}>
        <ThemeProvider theme={themes.dark}>
          <SCThemeProvide theme={themes.dark}>
            <ThemedGlobalStyle />
            <Router>
              <App />
            </Router>
          </SCThemeProvide>
        </ThemeProvider>
      </StyleSheetManager>
    </React.StrictMode>
  );
}
