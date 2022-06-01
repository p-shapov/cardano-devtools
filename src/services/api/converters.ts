import * as M from 'model/types';

import * as S from './types';

export const convertInstances = (data: S.GetInstancesResponse): Array<M.ContractInstance> => {
  return data.map(({ cicContract, cicDefinition, cicWallet }) => ({
    id: cicContract.unContractInstanceId,
    tag: cicDefinition.tag,
    walletId: cicWallet.getWalletId,
  }));
};

export const convertDefinitions = (data: Array<S.ContractDefinition>): Array<M.ContractDefinition> => {
  return data.map(({ csrDefinition }) => ({
    schema: csrDefinition,
  }));
};
