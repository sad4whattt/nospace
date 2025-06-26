// New file: simple.ts

import * as React from 'react';
import * as ReactDOM from 'react-dom';
const LandingPage: React.FC = () => {
  return (
    <div style={styles.container}>
      <header style={styles.header}>
        <h1 style={styles.title}>AI Software Landing Page</h1>
        <p style={styles.subtitle}>Revolutionizing the Future with AI</p>
      </header>
      <main style={styles.mainContent}>
        <section style={styles.section}>
          <h2 style={styles.sectionTitle}>Why Choose Our AI Software?</h2>
          <p style={styles.text}>
            Our cutting-edge AI brings efficiency and innovation to your business. We harness the power of artificial intelligence to deliver solutions that are not only smart but also transformative.
          </p>
        </section>
        <section style={styles.ctaSection}>
          <h2 style={styles.sectionTitle}>Try it Today!</h2>
          <button style={styles.ctaButton}>Get Started</button>
        </section>
      </main>
      <footer style={styles.footer}>
        <p style={styles.footerText}>© 2023 AI Software. All rights reserved.</p>
      </footer>
    </div>
  );
};
const styles: { [key: string]: React.CSSProperties } = {
  container: {
    fontFamily: 'Arial, sans-serif',
    color: '#333',
    lineHeight: 1.5,
    maxWidth: '800px',
    margin: '0 auto',
    padding: '20px',
    textAlign: 'center',
  },
  header: {
    marginBottom: '30px',
  },
  title: {
    fontSize: '2.5em',
    margin: '0',
  },
  subtitle: {
    fontSize: '1.2em',
    color: '#555',
  },
  mainContent: {
    marginBottom: '30px',
  },
  section: {
    marginBottom: '20px',
  },
  sectionTitle: {
    fontSize: '1.5em',
    margin: '10px 0',
  },
  text: {
    fontSize: '1em',
    color: '#666',
  },
  ctaSection: {
    marginTop: '40px',
  },
  ctaButton: {
    backgroundColor: '#007bff',
    color: '#fff',
    padding: '10px 20px',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    fontSize: '1em',
  },
  footer: {
    borderTop: '1px solid #ccc',
    marginTop: '20px',
    paddingTop: '10px',
  },
  footerText: {
    fontSize: '0.9em',
    color: '#555',
  },
};
ReactDOM.render(<LandingPage />, document.getElementById('root'));
