Projeto Terraform

    Tentei subir um EKS usando o Terraform e aparentemente criava a infraestrutura, bem pesada por sinal, mas não consegui acesso.
    Criei manualmente na interface da AWS e recebi a mensagem abaixo:

Cannot create cluster 'ADA-Terraform' because EKS does not support creating control plane instances in us-east-1e, the targeted availability zone. Retry cluster creation using control plane subnets that span at least two of these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f. Note, post cluster creation, you can run worker nodes in separate subnets/availability zones from control plane subnets/availability zones passed during cluster creation

    Acredito que mesmo o Terraform criando a infraestrutura, alguma politica da AWS não permite a execução do Control Plane como esperado.

    Simplifiquei e passei horas tentando subir o Min-IO na ECS, mas novamente, apesar de ativar, não consegui acesso externo.
    Não encontrei como liberar duas portas para um container no Terraform, o Min-IO usa a 9000 e 9001.

    Em cima da hora, a última tentativa passou a ser subir o REDIS como imagem.
    Na documentação do sistema, eles indicam usar o serviço cloud: https://redis.io/learn/operate/provisioning/terraform

    Testei também usando o EC2, criei 3 instâncias e instalei o Kubeadm, mas os pods não se enxergavam.
    Depois, percebi que o mesmo está acontecendo no meu laboratório em casa, não sei se houve alguma alteração no K8S posterior a entrega do projeto do módulo anterior.

    Uma dificuldade que não consegui resolver até o encerramento do ambiente no domingo, foi a criação do PV que depende da infraestrutura da AWS, criei um EFS mas faltou algo para a conexão (bind).

Com os reforços de aulas extras e a implementação do módulo final, subi a infraestrutura na aws usando o Terraform.

https://github.com/linconln/projeto.git
