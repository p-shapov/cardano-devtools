import { QueryClient } from 'react-query';
import { ContractDefinition, ContractInstance } from 'model/types';

import { convertDefinitions, convertInstances } from './converters';

export class PABApi {
  constructor(private queryClient: QueryClient) {}

  public async healthCheck() {
    // TODO:: setup health check
  }

  public getInstances = async () => {
    return this.queryClient.fetchQuery<Array<ContractInstance>>(
      'instances',
      () =>
        fetch('http://localhost:9080/api/contract/instances')
          .then((d) => d.json())
          .then(convertInstances),
      { initialData: [] },
    );
  };

  public getDefinitions = async () => {
    return this.queryClient.fetchQuery<Array<ContractDefinition>>(
      'definitions',
      () =>
        fetch('http://localhost:9080/api/contract/definitions')
          .then((d) => d.json())
          .then(convertDefinitions),
      { initialData: [] },
    );
  };
}

// response from api/contract/activate
// {
//   "unContractInstanceId": "032f562d-5bc4-48ab-a9c0-7560209aa272"
// }
