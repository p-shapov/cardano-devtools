import { useParams, useNavigate } from 'react-router';
import { InstancesPanel } from 'containers/instances-panel';
import { FC } from 'react';

export const Contract: FC = () => {
  const navigate = useNavigate();
  const { instanceId } = useParams();

  return <InstancesPanel activeInstance={instanceId ?? null} onInstanceChange={handleNavigate} />;

  function handleNavigate(instanceId: string | null) {
    navigate(instanceId ?? '/contract');
  }
};
