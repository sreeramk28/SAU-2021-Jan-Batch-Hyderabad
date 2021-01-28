import React from 'react';
import { View, Text } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
class Popular extends React.Component {
    state = {
        loading: true,
        movies: []
    };
    async componentDidMount() {
        const url = "https://api.themoviedb.org/3/movie/popular?api_key=e557e672bb899b79d10af3cc2153fd0e&language=en-US&page=1";
        const response = await fetch(url);
        const data = await response.json();
        this.setState({movies: data.results, loading: false});
    }
    render() {
        if (this.state.loading) {
            return (
                <Text>Loading...</Text>
            );
        }
        else if (this.state.movies.length == 0){
            return (
                <Text>Loading...</Text>
            );
        }
        return (
            <View 
            style={{
                flex: 1,
                flexDirection: 'column',
                alignItems: 'center',
                padding: 20,
                borderWidth: 1,
                borderColor: 'grey' 
            }} >
            <ScrollView
                style={{
                    
                    width: '100%',
                }}
            >
            {this.state.movies.map(movie => (
                <View 
                style={{
                    flex: 1,
                    flexDirection: 'column',
                    justifyContent: 'center',
                    alignItems: 'center',
                    borderBottomWidth: 1,
                    borderColor: 'green',
                    width: '100%',
                    minHeight: 50 
                }}>
                    <Text>{movie.original_title}</Text>
                    
                </View>
            ))}
            </ScrollView>
            </View>
        );
    }
}
export default Popular;