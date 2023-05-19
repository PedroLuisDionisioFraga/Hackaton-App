//classe principal
import 'package:flutter/material.dart';

class OurProductsSession extends StatelessWidget {
  const OurProductsSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: Center(
        child: Column(
          children: [
            Text(
              'A CyberFlow é uma empresa especializada em soluções de análise de dados de rede, oferecendo três planos distintos para atender às necessidades dos clientes. Esses planos são projetados para fornecer diferentes períodos de análise e armazenamento dos dados da rede, visando auxiliar as organizações na detecção de ameaças, monitoramento de desempenho e tomada de decisões estratégicas. O primeiro plano oferecido pela CyberFlow é o plano básico, que permite a análise dos dados da rede por um dia. Esse plano é ideal para situações em que uma avaliação rápida e pontual da segurança da rede é necessária. Por exemplo, se uma organização suspeitar de uma possível violação de segurança ou se desejar verificar o desempenho da rede em um determinado dia, o plano básico da CyberFlow pode fornecer as informações necessárias para avaliar a situação.',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'O segundo plano é o plano premium, que oferece a análise de dados da rede por uma semana, além de armazená-los para referência futura. Esse plano é recomendado para empresas que precisam de uma visão mais abrangente das atividades da rede ao longo de um período maior. A análise contínua por uma semana permite identificar padrões de tráfego, comportamentos anormais e possíveis ameaças que podem passar despercebidos em períodos mais curtos. Além disso, o armazenamento dos dados permite a análise retrospectiva e comparação de informações ao longo do tempo.',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'O terceiro plano oferecido pela CyberFlow é o plano avançado, que permite a análise de dados da rede por um ano e mantém esses dados armazenados. Esse plano é voltado para organizações que desejam uma análise de longo prazo para fins de auditoria, conformidade regulatória ou investigações internas. Ao permitir a análise dos dados da rede por um ano inteiro, a CyberFlow fornece informações valiosas sobre a segurança da rede, detecção de ameaças persistentes, identificação de padrões de tráfego de longo prazo e monitoramento do desempenho geral da rede ao longo do tempo.',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Independentemente do plano escolhido, a CyberFlow oferece um conjunto abrangente de recursos de análise de dados de rede. Isso inclui a identificação de atividades suspeitas, detecção de intrusões, análise de tráfego, geração de relatórios personalizados e muito mais. A empresa se dedica a fornecer aos clientes as ferramentas necessárias para proteger suas redes, otimizar o desempenho e garantir a integridade dos dados.',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Em resumo, os produtos da CyberFlow são projetados para atender às necessidades de análise de dados de rede de diferentes organizações. Com seus três planos distintos, a empresa oferece opções flexíveis que variam desde análises rápidas e pontuais até análises de longo prazo e armazenamento de dados. Ao escolher um dos planos da CyberFlow, as organizações podem obter informações valiosas sobre a segurança da rede, detecção de ameaças e desempenho geral da rede.',
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
