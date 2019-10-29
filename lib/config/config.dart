enum Env { PROD, DEV, STAGE, QA }

class Config {
  static Env env;
  // 网络请求基础地址
  static String get apiHost {
    switch (env) {
      case Env.PROD:
        return 'https://bwebapp.ejoyst.com';
      case Env.DEV:
        return 'https://bwebapp-dev-club.ejoyst.com';
      case Env.QA:
        return 'https://bwebapp-qa-club.ejoyst.com';
      case Env.STAGE:
        return 'https://bwebapp-stage-club.ejoyst.com';
      default:
        return 'https://bwebapp.ejoyst.com';
    }
  }

  // 图片基础地址
  static String get imgHost {
    switch (env) {
      case Env.PROD:
        return 'https://img.ejoyst.com';
      case Env.DEV:
        return 'https://img-dev-club.ejoyst.com';
      case Env.QA:
        return 'https://img-qa-club.ejoyst.com';
      case Env.STAGE:
        return 'https://img-stage-club.ejoyst.com';
      default:
        return 'https://img.ejoyst.com';
    }
  }
}
