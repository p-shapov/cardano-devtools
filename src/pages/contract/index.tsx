import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router';
import { QueryClient } from 'react-query';

import { useStore } from 'containers';
import { Tabs } from 'containers/show.instances';

import { Block } from './styles';

type Props = {};

const queryClient = new QueryClient();

export const Contract: React.FC<Props> = props => {
  const navigate = useNavigate();
  const { instanceId } = useParams();

  return (
    <Block>
      <Tabs activeInstance={instanceId ?? null} onInstanceChange={handleNavigate} />
    </Block>
  );

  function handleNavigate(instanceId: string | null) {
    navigate(instanceId ?? '/contract');
  }
};
