tot = ggplot(data=taxa, aes(x=t_species, y=redun, fill=t_species))+
  theme(axis.text.x = element_text(size=7, angle=90))+
  labs(title="", x="species ", y="coverage")+
  geom_bar(stat="identity")
tot



species = ggplot(data=taxa, aes(x=sample, y=redun, fill=t_species))+
  geom_bar(stat="identity")+
  labs(title=" ", x="samples ",fill="species", y="coverage")+
  theme(axis.text.x = element_text(size=7, angle=90))+
  scale_fill_manual(values=c("#FFFF00", "#FFCC00","#FF9900", "#FF3300", "#FF0099", "#FF99CC", "#CC99CC", "#660066", "#6666CC", "#0099CC", "#33FFCC", "#99FF99", "#99CC66", "#996600", "#993300", "#660000", "#993333", "#CC9999"))
species

genre = ggplot(data=taxa, aes(x=sample, y=redun, fill=t_genus))+
  geom_bar(stat="identity")+
  labs(title=" ", x="samples ",fill="genus", y="coverage")+
  theme(axis.text.x = element_text(size=7, angle=90))+
  scale_fill_manual(values=c("#FFFF00", "#FFCC00","#FF9900", "#FF3300", "#FF0099", "#FF99CC", "#CC99CC", "#660066", "#6666CC", "#0099CC", "#33FFCC", "#99FF99", "#99CC66","#666600", "#996600", "#993300", "#660000"))
genre
