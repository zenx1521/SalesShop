class AllItemsPartial extends React.Component {
    
    render(){
        let shop_items = this.props.shop_item.map(shop_item =>{
            return(
                <div key={shop_item.id } className="col-3 shop_item_holder">
                  <ShopItem path="http://localhost:3000/shop_items/"  shop_item={shop_item}/>
                </div>
            )
        })
        return(
            <div className="row">
                {shop_items}
            </div>
        )
    }
}