import { FC } from 'react';

import classes from './instances-panel.module.scss';

type Props = {
  activeInstance: string | null;
  onInstanceChange(instanceId: string | null): void;
};

export const InstancesPanel: FC<Props> = () => <div className={classes['root']}>instances panel</div>;
