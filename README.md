# Medidor de tráfego de redes

Aqui tem um passo a passo de como aplicar um medidor de tráfego de redes usando um **back-end** em **python** e enviando os dados via **socket** para uma aplicação em **dart**.

1) Instalar o **npcap** através desse [link](https://npcap.com/#download).
2) Instalar as bibliotecas necessárias para rodar o backend, rode no terminal o seguinte comando:
```
pip install -r "Backend/requirements.txt"
```
3) Rode sempre o arquivo "traffic_analyzer.py" primeiro do que o "main.dart"