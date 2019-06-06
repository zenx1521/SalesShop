const NewFruit = props => {
    let formFields = {}
    
    return(

        <form>
            <input ref={input => formFields.title = input} placeholder="Enter the title of the item"/>
            <input ref={input => formFields.description = input} placeholer="Enter the description here"/>
            <button>Submit</button>
        </form>
    )
}