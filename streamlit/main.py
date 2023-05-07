import streamlit as st
from streamlit_option_menu import option_menu

st.set_page_config(layout="wide")

with open('style.css') as f:
    st.markdown(f'<style>{f.read()}</style>', unsafe_allow_html=True)

st.title("Karbon Trust: GEAP x Mynt")

# NAVBAR
selected = option_menu(
    menu_title=None,
    options=["Sobre", "Modelo", "Dataset"],
    icons=["house", "activity", "clipboard"],
    menu_icon="cast",
    default_index=0,
    orientation="horizontal",
    styles={
        "container": {"padding": "0!important"},
        "nav-link-selected": {"background-color": "#904bff"}
    }
)
