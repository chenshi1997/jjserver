<template>
  <div
    class="sidebar-logo-container"
    :class="{ collapse: collapse }"
    :style="{
      backgroundColor:
        sideTheme === 'theme-dark' ? variables.menuBg : variables.menuLightBg,
    }"
  >
    <transition name="sidebarLogoFade">
      <div class="temp1" v-if="$store.state.user.roleType === 2">
        <el-select
          v-model="$store.state.user.gameId"
          placeholder="没有游戏权限"
          @change="selectChange"
        >
          <el-option
            v-for="item in gameIdsOption"
            :key="item.id"
            :label="item.gameName"
            :value="item.gameId"
          >
          </el-option>
        </el-select>
      </div>
      <router-link v-else key="expand" class="sidebar-logo-link" to="/">
        <h1
          class="sidebar-title"
          :style="{
            color:
              sideTheme === 'theme-dark'
                ? variables.sidebarTitle
                : variables.sidebarLightTitle,
          }"
        >
          {{ "管理后台" }}
        </h1>
      </router-link>
    </transition>
  </div>
</template>

<script>
import variables from "@/assets/styles/variables.scss";
import { getAllGameGroup } from "@/api/gamegroup/gamegroup";
export default {
  name: "SidebarLogo",
  props: {
    collapse: {
      type: Boolean,
      required: true,
    },
  },
  computed: {
    variables() {
      return variables;
    },
    sideTheme() {
      return this.$store.state.settings.sideTheme;
    },
  },

  created: function () {
    this.getAllGameGroup();
  },

  data() {
    return {
      game_group: [],
      gameIdsOption: [],
    };
  },

  methods: {
    selectChange(val) {
      this.$store.state.user.gameId = val;
    },

    getAllGameGroup() {
      getAllGameGroup().then((res) => {
        this.game_group = res;
        if (this.$store.state.user.gameIds) {
          this.game_group.forEach((element) => {
            this.$store.state.user.gameIds.forEach((e) => {
              if (element.gameId === e) {
                this.gameIdsOption.push(element);
                return;
              }
            });
          });
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.sidebarLogoFade-enter-active {
  transition: opacity 1.5s;
}

.sidebarLogoFade-enter,
.sidebarLogoFade-leave-to {
  opacity: 0;
}

.sidebar-logo-container {
  position: relative;
  width: 100%;
  height: 50px;
  line-height: 50px;
  background: #2b2f3a;
  text-align: center;
  overflow: hidden;

  & .sidebar-logo-link {
    height: 100%;
    width: 100%;

    & .sidebar-logo {
      width: 32px;
      height: 32px;
      vertical-align: middle;
      margin-right: 12px;
    }

    & .sidebar-title {
      display: inline-block;
      margin: 0;
      color: #fff;
      font-weight: 600;
      line-height: 50px;
      font-size: 14px;
      font-family: Avenir, Helvetica Neue, Arial, Helvetica, sans-serif;
      vertical-align: middle;
    }
  }

  &.collapse {
    .sidebar-logo {
      margin-right: 0px;
    }
  }
}
</style>

<style>
.temp1 .el-select .el-input__inner {
  background: rgba(17, 7, 7, 0.068) !important;
  color: rgb(167, 243, 221);
  text-align: center;
  font-weight: bold;
}
</style>


