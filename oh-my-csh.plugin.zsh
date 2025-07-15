# oh-my-csh.plugin.zsh

PLUGIN_DIR="${0:A:h}"
ARTS_DIR="${PLUGIN_DIR}/pokemon"

if (( RANDOM % 5 == 0 )); then
  questions=(
    "L’amortissement d’un matériel permet d’enregistrer la perte de valeur du matériel au cours de l’exercice : \na) Vrai \nb) Faux;a"
    "L’amortissement d’un matériel a pour conséquence une hausse de la trésorerie pour raison fiscale : \na) Vrai \nb) Faux;a"
    "L’amortissement linéaire d’un matériel correspond à un pourcentage fixe de dépréciation calculé sur la valeur nette comptable des machines : \na) Vrai \nb) Faux;b"
    "L’amortissement d’un matériel permet d’étaler le paiement du matériel sur sa durée de vie : \na) Vrai \nb) Faux;b"
    "Le montant des créances clients peut se retrouver dans le Compte de Résultat : \na) Vrai \nb) Faux;b"
    "Le solde positif de trésorerie, en fin d’exercice apparaît à l’actif du bilan en valeur positive : \na) Vrai \nb) Faux;a"
  )

  selected="${questions[RANDOM % ${#questions[@]}]}"
  IFS=';' read -r question correct <<< "$selected"

  echo -e "\n\033[1;31m💀 OH-MY-CSH : try to be a good Insaïen 💀\033[0m"
  echo -e "$question"
  echo -n "> Answer [a/b/c/d] : "
  read -r user_answer

   if [[ "$user_answer" == "$correct" ]]; then
    art_files=("$ARTS_DIR"/*.txt)
    clear
    idx=$(( (RANDOM % ${#art_files[@]}) + 1 ))
    art_file="${art_files[$idx]}"
    cat "$art_file"
    echo -e "\n"
  else
    echo -e "\033[1;31m❌ Bad answer ...\033[0m"
    sleep 1
    echo "💥 BOUM."
    exit 42
  fi
fi

