<template>
	<div>

		<Form :model="form" label-position="top">
			<Row :gutter="16">
				<Col span="12">
					<FormItem label="Name" prop="name">
						<Input v-model="form.name">
							<Icon type="person" slot="prepend"></Icon>
						</Input>
					</FormItem>
					<FormItem label="Birthdate" prop="birthdate">
						<DatePicker type="date" @on-change="setDate" v-model="form.birthdate">
						</DatePicker>
					</FormItem>
				</Col>
				<Col span="12">
					<FormItem label="Email" prop="email">
						<Input v-model="form.email">
							<Icon type="email" slot="prepend"></Icon>
						</Input>
					</FormItem>
					<FormItem label="Phone" prop="phone">
						<Input v-model="form.phone">
							<Icon type="ios-telephone" slot="prepend"></Icon>
						</Input>
					</FormItem>
				</Col>
				<Col span="24">
					<FormItem label="Signature" prop="sign">
						<div id="signature-pad" class="signature-pad">
							<div class="signature-pad--body">
								<canvas></canvas>
							</div>
						</div>
					</FormItem>
					<Button type="success" :loading="loading" @click="save">
						<span v-if="!loading">
							Submit Form
							<Icon type="android-send"></Icon>
						</span>
						<span v-else>Loading...</span>
					</Button>
					<Button type="primary" @click="undo">
						Undo
						<Icon type="ios-undo"></Icon>
					</Button>
					<Button type="primary" @click="erase">
						Erase
						<Icon type="backspace"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>

	</div>
</template>

<script>
import { eventBus } from '../../packs/sign.js'
import { post } from '../helpers/api'
import SignaturePad from 'signature_pad'

export default {
	data() {
		return {
			loading: false,
			canvas: null,
			pad: null,
			form: {}
		}
	},
	created() {
		eventBus.$emit('changeTitle', 'Signing Form')
	},
	mounted() {
		this.initSignature()
		this.resizeCanvas()
		this.$nextTick(() => {
			window.addEventListener('resize', this.resizeCanvas)
		})
	},
	methods: {
		initSignature() {
			this.canvas = document.querySelector('canvas')
			this.pad = new SignaturePad(this.canvas)
		},
		resizeCanvas() {
			let ratio = Math.max(window.devicePixelRatio || 1, 1)
			this.canvas.width = this.canvas.offsetWidth * ratio
			this.canvas.height = this.canvas.offsetHeight * ratio
			this.canvas.getContext("2d").scale(ratio, ratio)
			this.pad.clear()
			this.drawLine(this.canvas.width)
		},
		drawLine(width) {
			let ctx = this.canvas.getContext("2d")
			ctx.setLineDash([5, 3])
			ctx.beginPath()
			ctx.moveTo(40,145)
			ctx.lineTo(width - 1115, 145)
			ctx.strokeStyle = "#C0C2C8"
			ctx.stroke()
		},
		erase() {
			this.pad.clear()
			this.resizeCanvas()
		},
		undo() {
			let data = this.pad.toData()
			if (data) {
				data.pop();
				this.pad.fromData(data);
				this.resizeCanvas()
			}
		},
		setDate() {
			var date = new Date(this.form.birthdate)
			date.setDate(date.getDate() + 1)
			this.form.birthdate = date
		},
		save() {
			this.form.sign = JSON.stringify(this.pad.toData())
			post('/signs', this.form)
			.then((res) => {
				this.$Notice.success({title: 'Sign Form', desc: 'Sign created successfully.', duration: 4})
				this.form = {}
			})
			.catch((err) => {
				var message = ''
				for(let i of err.response.data) {
					message += `<li>${i}</li>`
				}
				this.$Notice.error({
					title: 'Error saving signing',
					desc: message
				});
			})
		}
	}
}
</script>