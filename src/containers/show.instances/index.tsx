import { FC, useEffect, useState } from 'react';
import { Tab, Tabs as MUITabs } from '@mui/material';

import { ContractInstance } from 'model/types';
import { useStore } from 'containers/context';

import { ActivateContractPanel } from '../activate.contract.panel';
import { Block, Content } from './styles';

type Props = {
  activeInstance: string | null;
  onInstanceChange: (instanceId: string | null) => void;
};

const NEW_INSTANCE = '@@new';

export const Tabs: FC<Props> = ({ activeInstance, onInstanceChange }) => {
  const [instances, setInstances] = useState<ContractInstance[]>([]);
  const { api } = useStore();

  useEffect(() => {
    api.pab.getInstances().then(setInstances);
  }, []);

  return (
    <Block>
      <MUITabs
        orientation="vertical"
        variant="scrollable"
        value={activeInstance ?? NEW_INSTANCE}
        onChange={handleChange}
      >
        <Tab label="New" value={NEW_INSTANCE} />
        {instances.map(i => (
          <Tab key={i.id} label={i.id} value={i.id} />
        ))}
      </MUITabs>
      <Content>{activeInstance === null ? <ActivateContractPanel /> : null}</Content>
    </Block>
  );

  function handleChange(_: any, newValue: string) {
    onInstanceChange(newValue === NEW_INSTANCE ? null : newValue);
  }
};
