import { QueryClient } from 'react-query';

import { PABApi } from './pab';

export class Api {
  private queryClient: QueryClient;
  public pab: PABApi;

  constructor() {
    this.queryClient = new QueryClient();
    this.pab = new PABApi(this.queryClient);
  }
}
