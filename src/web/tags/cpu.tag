<accesses-cpu>
	<span>CPU: { usage != null ? (usage * 100).toFixed(1) : '-' }% <accesses-meter ref="meter" max={ 1 } /></span>

	<style>
		:scope
			display inline-block
			color #fff
	</style>

	<script>
		this.mixin('stream');

		this.on('mount', () => {
			this.stream.on('status', this.onStatus);
		});

		this.on('unmount', () => {
			this.stream.off('status', this.onStatus);
		});

		this.onStatus = status => {
			this.update({
				usage: status.cpuUsage
			});

			this.refs.meter.update({
				value: this.usage
			});
		};
	</script>
</accesses-cpu>