import { useEffect, useState } from 'react';

import { ContractDefinition } from 'model/types';
import { useStore } from 'containers/context';

import { Form } from './styles';

export const ActivateContractPanel = () => {
  const [definitions, setDefinitions] = useState<ContractDefinition[]>([]);
  const { api } = useStore();

  useEffect(() => {
    api.pab.getDefinitions().then(setDefinitions);
  }, []);

  console.log(definitions);

  return <>New Contract</>;
};
