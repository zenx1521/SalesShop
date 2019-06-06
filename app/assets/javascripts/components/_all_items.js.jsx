class AllItems extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            allItems: []
        }
        this.handleClick = this.handleClick.bind(this);

    }

    handleClick(){
        alert("TT");
    }

    componentDidMount(){
        fetch('/shop_items.json')
          .then(response =>  response.json())
          .then(data => this.setState( {allItems: data }) );
    }
    render(){
        let shop_items_partials = [];
        for(let i = 0;i < Math.ceil(this.state.allItems.length/3);i++){
            shop_items_partials.push(this.state.allItems.slice(i*3,(i+1)*3));
        }
        let key_id = 0;
        let shop_items = shop_items_partials.map(shop_item => {
            key_id++;
            return(
                <div key={key_id}>
                    <AllItemsPartial shop_item={shop_item}/>
                </div>
            )
        })
            return(
                <div className="container">
                    {shop_items}
                    <button onClick={this.handleClick}>BTN</button>

                </div>
            )
    }
}