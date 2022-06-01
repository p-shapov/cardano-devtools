import 'styled-components';
import { Theme } from '@mui/material';

declare module 'styled-components' {
  export type Color = string;
  export interface DefaultTheme extends Theme {}
}
