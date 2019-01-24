sync function getData(){
	const result = await axios.get('https://dube.io/service/ping')
	const data = result.data

	console.log('data', data)

	return data

}

  getData()
