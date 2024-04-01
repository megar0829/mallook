import React from 'react';
import styles from "../start/worldCupStartPage.module.css";

export default React.forwardRef<HTMLDivElement, React.ComponentProps<'div'>>(function Box(
	props,
	ref,
) {
	return (
		<div
			{...props}
			ref={ref}
			className={styles.box}
		/>
	);
});
