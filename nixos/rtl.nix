{ pkgs, ... }: {
  # Указываем репозиторий драйвера
  rtl8192eu = pkgs.fetchFromGitHub {
    owner = "Mange";
    repo = "rtl8192eu-linux-driver";
    rev = "73f5c4359a6e9f680a533fb7140b169f002499cb"; # Укажите конкретный коммит или ветку
    sha256 = "12j0wv88d1wzi0gmp37riar2q1fsxn6d9ly0n1kjm0rgvyraa9rk"; # Замените на правильный хэш
  };

  # Копируем репозиторий в систему
  environment.etc."rtl8192eu".source = rtl8192eu;

  # Добавляем драйвер в сборку
  boot.extraModulePackages = with pkgs.linuxPackages; [
    (import "${rtl8192eu}" { inherit pkgs; })
  ];
}