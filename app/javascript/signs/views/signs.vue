<template>
	<div>Index</div>
</template>

<script>
import { eventBus } from '../../packs/sign.js'

export default {
	data() {
		return {}
	},
	created() {
		eventBus.$emit('changeTitle', 'Signing List')
	}
}
</script>
