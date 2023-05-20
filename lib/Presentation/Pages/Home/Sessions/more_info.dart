import 'package:flutter/material.dart';

class MoreInformationSession extends StatelessWidget {
  const MoreInformationSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        children: [
          Text(
            'Nossa plataforma foi desenvolvida com o compromisso de aderir às melhores práticas e aos requisitos estabelecidos pela Lei Geral de Proteção de Dados (LGPD). Reconhecemos a importância da privacidade e da proteção dos dados pessoais, e estamos empenhados em garantir que nossos usuários possam utilizar nossa plataforma com tranquilidade, sabendo que seus dados estão sendo tratados de acordo com as normas legais e éticas.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Uma das principais características da nossa plataforma é a adoção de medidas robustas de segurança para proteger os dados pessoais dos usuários. Implementamos controles de acesso rigorosos, criptografia de dados em trânsito e em repouso, e políticas de segurança que abrangem a prevenção e a detecção de incidentes de segurança. Essas medidas ajudam a garantir a integridade, a confidencialidade e a disponibilidade dos dados pessoais armazenados na plataforma.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Além disso, nossa plataforma permite que os usuários tenham controle sobre seus dados pessoais. Seguindo os princípios da transparência e da autonomia do titular dos dados, fornecemos opções claras para que os usuários possam revisar, atualizar ou excluir suas informações pessoais, conforme exigido pela LGPD. Também garantimos que os usuários sejam informados de forma clara e detalhada sobre a finalidade do tratamento de seus dados e quais são os seus direitos em relação a esses dados.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Outro aspecto importante é a adoção de práticas de minimização de dados. Nossa plataforma coleta apenas as informações estritamente necessárias para o funcionamento adequado dos serviços oferecidos. Evitamos a coleta excessiva ou desnecessária de dados pessoais, o que contribui para a redução de riscos e para a conformidade com a LGPD. Além disso, implementamos medidas para garantir a anonimização ou a pseudonimização dos dados, sempre que possível, de forma a proteger a identidade dos titulares dos dados.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Também estabelecemos um programa de governança de dados eficiente, que inclui a designação de um encarregado de proteção de dados (DPO) responsável por supervisionar a conformidade com a LGPD, realizar avaliações de impacto à proteção de dados, promover treinamentos e conscientização para os funcionários e monitorar a conformidade em todos os aspectos da plataforma.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Em resumo, nossa plataforma está em conformidade com os requisitos da LGPD e adota boas práticas de proteção de dados para garantir a privacidade e a segurança das informações pessoais dos usuários. Nosso compromisso é fornecer uma solução confiável e transparente, onde os usuários possam ter controle sobre seus dados e sintam-se seguros ao utilizá-la. Estamos constantemente atualizando nossos processos e práticas para manter a conformidade com as leis de proteção de dados e as melhores práticas do mercado.',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
