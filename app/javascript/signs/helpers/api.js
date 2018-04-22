import axios from 'axios'

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token

export function get(url) {
	return axios({
		method: 'GET',
		url: url
	})
}

export function post(url, payload) {
	return axios({
		method: 'POST',
		url: url,
		data: payload
	})
}

export function del(url) {
	return axios({
			method: 'DELETE',
			url: url
	})
}