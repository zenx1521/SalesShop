

class ShopItem extends React.Component {



    render() {
        console.log(this.props.shop_item.id)
        return(
            <div>
                <a href={this.props.path + this.props.shop_item.id}>{this.props.shop_item.title}</a>
                <p>{this.props.shop_item.description}</p>
                {this.props.shop_item.shop_item_images.length > 0 &&
                    <img src={this.props.shop_item.shop_item_images[0].picture_path.url} style={{width: 100 +'px'}}/>
                }
            </div>
        )
    }
}