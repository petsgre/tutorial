import React from "react";

const ServiceList = ({ children, ...props }) => {
  console.log(React.Children);
  console.log(props);

  const childrenWithProps = React.Children.toArray(children)
    .map(child => {
      console.log(child);
      return React.cloneElement(child, props)
    }
    );
  return (
    <div>
      {childrenWithProps}
    </div>
  )
}

const Item = ({ ...props }) => {
  console.log(props);

  return (
    <li>
      item
    </li>
  );
};




ServiceList.Item = Item;

export default ServiceList;