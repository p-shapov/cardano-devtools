import { createGlobalStyle } from 'styled-components';

import Retro from 'assets/fonts/RetroComputer.ttf';
import AbadiWoff2 from 'assets/fonts/AbadiMTStd.woff2';
import AbadiWoff from 'assets/fonts/AbadiMTStd.woff';
import AbadiExtraLightWoff2 from 'assets/fonts/AbadiMTStd-ExtraLight.woff2';
import AbadiExtraLightWoff from 'assets/fonts/AbadiMTStd-ExtraLight.woff';
import AbadiBoldWoff2 from 'assets/fonts/AbadiMTStd-Bold.woff2';
import AbadiBoldWoff from 'assets/fonts/AbadiMTStd-Bold.woff';

export const FixedGlobalStyle = createGlobalStyle`
  @font-face {
    font-family: Retro;
    src: url(${Retro});
  }

  @font-face {
    font-family: 'Abadi MT Std';
    src: url(${AbadiWoff2}) format('woff2'),
        url(${AbadiWoff}) format('woff');
    font-weight: normal;
    font-style: normal;
    font-display: swap;
}

@font-face {
    font-family: 'Abadi MT Std';
    src: url(${AbadiExtraLightWoff2}) format('woff2'),
        url(${AbadiExtraLightWoff}) format('woff');
    font-weight: 200;
    font-style: normal;
    font-display: swap;
}

@font-face {
    font-family: 'Abadi MT Std';
    src: url(${AbadiBoldWoff2}) format('woff2'),
        url(${AbadiBoldWoff}) format('woff');
    font-weight: bold;
    font-style: normal;
    font-display: swap;
}


  html, input, textarea, button {
    font-family: 'Abadi MT Std', sans-serif;
    letter-spacing: -0.018em;
    font-display: fallback;
  }
  @supports (font-variation-settings: normal) {
    html, input, textarea, button {
      font-family: 'Abadi MT Std', sans-serif;
    }
  }
  


  html,
  body {
    margin: 0;
    padding: 0;
  }

  * {
    box-sizing: border-box;
  }

  button {
    user-select: none;
  }

  html {
    font-family: 'Abadi MT Std', sans-serif;
    font-size: 14px;
    font-variant: none;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  }
`;

export const ThemedGlobalStyle = createGlobalStyle`
  body {
    min-height: 100vh;
    color: ${({ theme }) => theme.palette.text.primary};
    background-color: ${({ theme }) => theme.palette.background.default};
  }
`;
