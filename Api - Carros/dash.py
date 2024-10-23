import streamlit as st
import pandas as pd
import plotly.express as px
from streamlit_option_menu import option_menu
from query import conexao
import pydeck as pdk
import numpy as np

query = "SELECT * FROM tbcarros"

#busca os dados na inicialização
df = conexao(query)

#botao de atualizar os dados
if st.button("Atualizar Dados"):
    df = conexao(query)

#sidebar
st.sidebar.header("Selecione o Filtro")

#filtros
marca = st.sidebar.multiselect("Marca Selecionada", options=df['marca'].unique(), default=df["marca"].unique())
modelo = st.sidebar.multiselect("Modelo Selecionado", options=df['modelo'].unique(), default=df["modelo"].unique())
ano = st.sidebar.multiselect("Ano Selecionado", options=df['ano'].unique(), default=df["ano"].unique())
valor = st.sidebar.multiselect("Valor Selecionado", options=df['valor'].unique(), default=df["valor"].unique())
cor = st.sidebar.multiselect("Cor Selecionada", options=df['cor'].unique(), default=df["cor"].unique())
numeroVendas = st.sidebar.multiselect("Numero de Vendas Selecionado", options=df['numeroVendas'].unique(), default=df["numeroVendas"].unique())

#aplicar os filtros
df_selecionado = df[
    (df["marca"].isin(marca)) &
    (df["modelo"].isin(modelo)) &
    (df["ano"].isin(ano)) &
    (df["valor"].isin(valor)) &
    (df["cor"].isin(cor)) &
    (df["numeroVendas"].isin(numeroVendas))
]

#exibir valores

def Home():
    #mostra dados filtrados
    with st.expander("Valores"):
        mostrarDados = st.multiselect('Filter: ', df_selecionado, default=[])

        if mostrarDados:
            st.write(df_selecionado[mostrarDados])
    
    #estatisticas de vendas
    if not df_selecionado.empty:
        venda_total = df_selecionado["numeroVendas"].sum()
        venda_media = df_selecionado["numeroVendas"].mean()
        venda_mediana = df_selecionado["numeroVendas"].median()

        total1, total2, total3 = st.columns(3, gap="large")
        
        with total1:
            st.info("Valor Total de Vendas dos Carros", icon='📌')
            st.metric(label="Total", value=f"{venda_total:,.0f}")
        with total2:
            st.info("Valor Médio de Vendas dos Carros", icon='📌')
            st.metric(label="Média", value=f"{venda_media:,.0f}")
        with total3:
            st.info("Valor Mediano de Vendas dos Carros", icon='📌')
            st.metric(label="Mediana", value=f"{venda_mediana:,.0f}")
    else:
        st.warning("Nenhum dado disponível com os filtros selecionados")
    
    #divisoria
    st.markdown("""---------""")

    #graficos
def graficos(df_selecionado):
        if df_selecionado.empty:
            st.warning("Nenhum dado disponível para gerar gráficos")
            #interrompe a função
            return
        
        #criação dos gráficos

        graf1, graf2, graf3, graf4, graf5, graf6 = st.tabs(["Gráfico de Barras", "Gráfico de Linhas", "Gráfico de Pizza", "Gráfico de Dispersão", "Gráfico no mapa", "Grafico"])        

        with graf1:
            st.write("Grafico de Barras")
            investimento = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending = False)

            fig_valores = px.bar(
                investimento, 
                x=investimento.index, 
                y="valor", 
                orientation="v",
                title="<b>Valores de Carros</b>", 
                color_discrete_sequence=["#0083b3"])
            st.plotly_chart(fig_valores, use_container_width = True)

        with graf2:
            st.write("Grafico de Linhas")
            dados = df_selecionado.groupby("marca").count()[["valor"]]

            fig_valores2 = px.line(
                dados, 
                x=dados.index, 
                y="valor", 
                title="<b>Valores poe Marca</b>", 
                color_discrete_sequence=["#0083b3"])
            st.plotly_chart(fig_valores2, use_container_width = True)

        with graf3:
            st.write("Grafico de Pizza")
            dados2 = df_selecionado.groupby("marca").sum()[["valor"]]

            fig_valores3 = px.pie(
                dados2, 
                values="valor", 
                names=dados2.index, 
                title="<b>Distribuicao de Valores por Marca</b>")
            st.plotly_chart(fig_valores3, use_container_width = True)

        with graf4:
            st.write("Grafico de Dispersao")
            dados4 = df_selecionado.melt(id_vars="marca", value_vars=["valor"])

            fig_valores4 = px.scatter(
                dados4,
                x="marca", 
                y="value", 
                title="<b>Dispersao de Valores por Marca</b>", 
                color="variable")
            st.plotly_chart(fig_valores4, use_container_width = True)

        with graf5:
            st.write("Mapa 3D")
            dados5 = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending = True)
            chart_data = pd.DataFrame(
                dados5,
                columns=["lat", "lon"],
                )

            st.pydeck_chart(
                pdk.Deck(
                    map_style=None,
                    initial_view_state=pdk.ViewState(
                        latitude=-23.6226,
                        longitude=-46.5489,
                        zoom=11,
                        pitch=50,
                    ),
                    layers=[
                        pdk.Layer(
                            "HexagonLayer",
                            data=chart_data,
                            get_position="[lon, lat]",
                            radius=200,
                            elevation_scale=4,
                            elevation_range=[0, 1000],
                            pickable=True,
                            extruded=True,
                        ),
                        pdk.Layer(
                            "ScatterplotLayer",
                            data=chart_data,
                            get_position="[lon, lat]",
                            get_color="[200, 30, 0, 160]",
                            get_radius=200,
                        ),
                    ],
                )
            )

        with graf6:
            st.write("Mapa 3D")
           

            chart_data = pd.DataFrame(
                np.random.randn(1000, 2) / [50, 50] + [-23.6226, -46.5489],
                columns=["lat", "lon"],
                )

            st.pydeck_chart(
                pdk.Deck(
                    map_style=None,
                    initial_view_state=pdk.ViewState(
                        latitude=-23.6226,
                        longitude=-46.5489,
                        zoom=11,
                        pitch=50,
                    ),
                    layers=[
                        pdk.Layer(
                            "HexagonLayer",
                            data=chart_data,
                            get_position="[lon, lat]",
                            radius=200,
                            elevation_scale=4,
                            elevation_range=[0, 1000],
                            pickable=True,
                            extruded=True,
                        ),
                        pdk.Layer(
                            "ScatterplotLayer",
                            data=chart_data,
                            get_position="[lon, lat]",
                            get_color="[200, 30, 0, 160]",
                            get_radius=200,
                        ),
                    ],
                )
            )


def barraprogresso():
    valorAtual = df_selecionado["numeroVendas"].sum()
    objetivo = 25000000
    percentual = round((valorAtual / objetivo * 100))

    if percentual > 100:
        st.subheader("Valores Atingidos!!!")
    else:
        st.write(f"Você tem {percentual}% de {objetivo}. Vai no corre!")
        mybar = st.progress(0)
        for percentualCompleto in range(percentual):
            mybar.progress(percentualCompleto + 1, text="Alvo %")
            
def menuLateral():
    with st.sidebar:
        selecionado = option_menu(
            menu_title="Menu", 
            options=["Home", "Progresso"],
            icons=["house", "eye"],
            menu_icon="cast",
            default_index=0)
        
    st.subheader(f"Página: {selecionado}")
    if selecionado == "Home":
        Home()
        graficos(df_selecionado)

    if selecionado == "Progresso":
        barraprogresso()
        graficos(df_selecionado)


menuLateral()