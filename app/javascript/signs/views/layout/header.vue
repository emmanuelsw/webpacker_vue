<template>
  <Header>
    <div class="container">
      <Row>

        <Col span="6">
          <div class="layout-logo"></div>
        </Col>

        <Col span="18">
          <Menu mode="horizontal" theme="dark" active-name="1">
            <div class="layout-nav">
              <MenuItem name="1">
                <router-link to="/">
                  <Icon type="ios-keypad"></Icon>
                  Signs
                </router-link>
              </MenuItem>
              <MenuItem name="2">
                <router-link to="/form">
                  <Icon type="ios-navigate"></Icon>
                  Form
                </router-link>
              </MenuItem>
              <MenuItem name="3">
                <Icon type="ios-analytics"></Icon>
                About Us
              </MenuItem>
              <MenuItem name="4">
                <Icon type="ios-paper"></Icon>
                Contact
              </MenuItem>
            </div>
          </Menu>
        </Col>

      </Row>
      
    </div>
  </Header>
</template>

<style scoped>
.layout-logo{
  width: 100px;
  height: 30px;
  background: #5b6270;
  border-radius: 3px;
  margin-top: 16px;
}
.layout-nav{
  float: right;
}
.ivu-menu-item:last-child {
  padding-right: 0;
}
.ivu-menu-item a {
  color: rgba(255, 255, 255, .7);
}
.ivu-menu-item a:hover {
  color: rgba(255, 255, 255, .7);
}
.ivu-layout-header {
  padding: 0px !important;
}

.ivu-menu-horizontal {
  height: 64px !important;
}
</style>
